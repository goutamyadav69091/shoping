class User < ApplicationRecord
	# has_secure_password
	has_many :products
	has_many :carts
	has_many :orders 
	validates :name ,:email , :contact ,:address ,:password,:stripe_id, presence: true
	validates :email , uniqueness: true 
	before_validation :create_on_stripe, on: :create
  def create_on_stripe
    params = { email: email, name: name }
    customer = Stripe::Customer.create(params)
    self.stripe_id = customer.id
  end
end
