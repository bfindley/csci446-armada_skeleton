# Using declarative_authorization.
authorization do
  role :guest do
    has_permission_on :fighters, :to => [:index, :show]
  end
  role :member do
    has_permission_on :members_members, :to => :read
    has_permission_on :members_fighters, :to => :manage
    has_permission_on :members_fighters, :to => :favorites
    has_permission_on :favorites, :to => [:create, :delete]
  end
  role :administrator do
    includes :member
    has_permission_on :admin_admin, :to => :read
    has_permission_on :admin_users, :to => :manage
    has_permission_on :admin_roles, :to => :manage
    has_permission_on :admin_fighters, :to => :manage
    has_permission_on :admin_fighters, :to => :favorites
    has_permission_on :favorites, :to => :manage
  end
  role :developer do
    includes :administrator
  end
end

privileges do
  privilege :manage, :includes => [:create, :read, :update, :delete]
  privilege :read, :includes => [:index, :show]
  privilege :create, :includes => :new
  privilege :update, :includes => [:edit]
  privilege :delete, :includes => :destroy
end
