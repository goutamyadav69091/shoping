class Product < ApplicationRecord
	paginates_per 20
	belongs_to :user
	has_many :carts
	has_many :orders, through: :carts
end
