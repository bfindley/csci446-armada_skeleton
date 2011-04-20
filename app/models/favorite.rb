class Favorite < ActiveRecord::Base
  belongs_to :fighter
  belongs_to :user
  
  attr_accessible :fighter_id, :user_id
  
  def self.get_favorites_hash(current_user)
    @favorites_array = Favorite.find(:all, :conditions => {:user_id => current_user.id}).to_a
    @favorites = @favorites_array.inject({}) do |result, element|
      result[element[:fighter_id]] = 1 # 1 meaning that it exists
      result
    end
    return @favorites
  end
  

end
