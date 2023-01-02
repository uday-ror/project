class Coffee < ApplicationRecord
  	has_one_attached :image
	belongs_to :user  	
  	validates :name, presence: true, length: { maximum: 20 }
  	validates :amount, presence: true, length: { minimum: 3 }
  	paginates_per 6

end
