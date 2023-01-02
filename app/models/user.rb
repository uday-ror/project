class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :coffees       
  has_many :payments
  has_many :orders, dependent: :destroy
  has_many :items, :as => :itemable
end
