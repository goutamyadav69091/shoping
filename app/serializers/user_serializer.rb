class UserSerializer < ActiveModel::Serializer
	attributes :id, :name, :email, :address, :is_admin, :products
end
