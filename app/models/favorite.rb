class Favorite < ActiveRecord::Base
  belongs_to :fighter
  belongs_to :user
  
  attr_accessible :fighter_id, :user_id
end
