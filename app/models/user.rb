class User < ApplicationRecord
  # has_secure_password
  has_many :products
  has_many :carts
  has_many :orders 
	validates :name ,:email , :contact ,:address ,:password, presence: true
	validates :email , uniqueness: true 
end
