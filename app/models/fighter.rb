class Fighter < ActiveRecord::Base
  belongs_to :user
  
  validates_numericality_of :cost
  
  def date
    self.created_at.strftime("%b %d, %Y")
  end
  
  
  
end
