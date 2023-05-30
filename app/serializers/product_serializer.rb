class ProductSerializer < ActiveModel::Serializer
	attributes :id, :name, :price, :product_type, :user
end
