class Fighter < ActiveRecord::Base
  belongs_to :user
  has_many :favorites
  
  validates_numericality_of :cost
  
  validates_numericality_of :cost
  
  def date
    self.created_at.strftime("%b %d, %Y")
  end
  
  def get_favorite_image(current_user)
    @favorite = Favorite.find(:first, :conditions => {:user_id => current_user.id, :fighter_id => self.id})
    if(@favorite.nil?)
      return 'icon_small_star_inactive.png'
    else
      return 'icon_small_star.png'
    end
  end
  
  
end
