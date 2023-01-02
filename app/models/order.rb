class Order < ApplicationRecord
	belongs_to :user 
    has_one :payment
    has_many :items, :as => :itemable
  	validates :permanent_address, presence: true
  	validates :mobile_no, length: { maximum: 10, too_long: "%{count} number is the maximum allowed" }
    validates :pincode, length: { maximum: 6, too_long: "%{count} digit pincode number only  allowed" }
    
end
        