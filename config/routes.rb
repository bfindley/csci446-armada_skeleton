ActionController::Routing::Routes.draw do |map|
  
  map.resources :fighters

  map.root :controller => "fighters", :action => "index"
  map.logout 'logout', :controller => "user_sessions", :action => "destroy"
  map.login 'login', :controller => "user_sessions", :action => "new"
  map.resources :user_sessions, :only => [:new, :create, :destroy]
  map.resources :password_resets, :only => [:new, :create, :edit, :update]
  
  map.register 'register', :controller => 'users', :action => 'new'
  map.resources :users, :only => [:new, :create]

  map.namespace :admin do |admin|
    admin.resources :roles
    admin.resources :users
    admin.resources :fighters
	  admin.resources :fighters, :member => { :favorites => :put }
    admin.root :controller => 'admin', :action => 'index'
  end

  map.namespace :members do |members|
    members.my_favorite_fighters 'my_favorite_fighters',
      :conditions => {:method => :get},
      :controller => "fighters",
      :action => "my_favorite_fighters"
    
    members.my_fighters 'my_fighters',
      :conditions => {:method => :get},
      :controller => "fighters",
      :action => "my_fighters"
    
    members.resources :users, :only => [:show, :edit, :update]
    members.resources :fighters
    members.resources :fighters,
      :collections => { :my_favorite_fighters => :get, :my_fighters => :get},
      :member => { :favorites => [:put, :get] }
    members.root :controller => 'members', :action => 'index'  
  end

end
