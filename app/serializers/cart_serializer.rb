class CartSerializer < ActiveModel::Serializer
	# attributes :id, :product_id, :price, :product_type, :product_qty, :user_id
	attributes :id, :product_id, :product_qty, :user_id ,:product
	def product
		{
			name:object.product.name,
			price:object.product.price
		}
	end
end
