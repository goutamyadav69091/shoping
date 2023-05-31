class Payment < ApplicationRecord
	attr_accessor :credit_card_number, :credit_card_exp_month, :credit_card_exp_year, :credit_card_cvv
	belongs_to :order
	before_validation :create_on_stripe
	def create_on_stripe
		byebug
		token = get_token
		response = Stripe::PaymentIntent.create(
				  :customer => order.user.stripe_id,
				  :amount => order.amount,
				  :description => 'Rails Stripe transaction',
				  :currency => 'usd',
				  :payment_method_data => {
						type: 'card',
						card: {
							token: token
						}
				  }
				)
		self.stripe_id = response.id
	end
	def get_token
		Stripe::Token.create({
			card: {
				number: credit_card_number,
				exp_month: credit_card_exp_month,
				exp_year: credit_card_exp_year,
				cvc: credit_card_cvv,
			}
		})
	end
end
