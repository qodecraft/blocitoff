class Item < ActiveRecord::Base
  belongs_to :list
  belongs_to :user
  
   def days_left
      (DateTime.now.to_date - created_at.to_date).to_i
   end
  
end
