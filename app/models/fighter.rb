class Fighter < ActiveRecord::Base
  belongs_to :user
  has_many :favorites
  
  has_attached_file :photo, :styles => {:normal => "200x200>", :thumb => "60x60>"}
  
  validates_presence_of :name
  validates_presence_of :fighter_type
  validates_presence_of :primary_weapon
  validates_presence_of  :cost
  validates_presence_of :description
  validates_attachment_presence :photo 
  
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
