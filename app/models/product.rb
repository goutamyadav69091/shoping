class Product < ApplicationRecord
	belongs_to :user
	has_many :carts
	has_many :orders, through: :carts
end
