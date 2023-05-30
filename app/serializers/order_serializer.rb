class OrderSerializer < ActiveModel::Serializer
	attributes :id ,:cart_id,:shiping_address,:payment_mode,:order_status,:user_id,:cart

	def cart
			{
				product_qty:object.cart.product_qty,
				product_name:object.cart.product.name,
				product_price:object.cart.product.price
			}
		end
end
