class Fighter < ActiveRecord::Base
  belongs_to :user
  
  def date
    self.created_at.strftime("%b %d, %Y")
  end
  
  
end
