class Order < ApplicationRecord
	attr_accessor :credit_card_number, :credit_card_exp_month, :credit_card_exp_year, :credit_card_cvv
	after_create :create_payment
	belongs_to :cart
	belongs_to :user
	has_one :payment

	enum order_status: {
		placed: 0,
		shipped: 1,
		delivered: 2,
		canceled: 3
	}

	enum payment_mode: [:card,:cash,:online]

	def create_payment
		params = {
			order_id: id,
			credit_card_number: credit_card_number,
			credit_card_exp_month: credit_card_exp_month,
			credit_card_exp_year: credit_card_exp_year,
			credit_card_cvv: credit_card_cvv
		}
		Payment.create!(params)
	end

end
