class UserStock < ApplicationRecord
    belongs_to :user
    belongs_to :stock
  
    before_create :set_created_at

  private
   
    def set_created_at
      self.created_at = Time.now.in_time_zone(self.user.time_zone).to_time
    end
     
end
