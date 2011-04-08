class Role < ActiveRecord::Base
  
  has_paper_trail
  
  validates_uniqueness_of :name
  validates_presence_of :name
  validates_length_of :name, :minimum => 1

  has_many :users

  def initialize(params=nil)
    super(params)
    # Makes name lowercase and removes unnecessary whitespace
    if(!self.name.nil?)
      self.name = self.name.strip.downcase
    end
  end

  def to_s
    self.name
  end
  
end


# == Schema Information
#
# Table name: roles
#
#  id          :integer         not null, primary key
#  name        :string(255)     not null
#  description :string(255)
#  users_count :integer         default(0)
#  created_at  :datetime
#  updated_at  :datetime
#

