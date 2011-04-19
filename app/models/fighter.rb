class Fighter < ActiveRecord::Base
  belongs_to :user
  has_many :favorites
  
  validates_numericality_of :cost
  
  validates_numericality_of :cost
  
  def date
    self.created_at.strftime("%b %d, %Y")
  end
  
  def update_favorite
    #@favorite = Favorite.new( {:user_id => current_user.id, :fighter_id => self.id} ) 
    puts "*************************************************************************"
  end
  
  
end
