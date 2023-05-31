ActiveAdmin.register Cart do

	# See permitted parameters documentation:
	# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
	#
	# Uncomment all parameters which should be permitted for assignment
	#
	# permit_params :user_id, :product_id, :product_qty
	#
	# or
	#
	# permit_params do
	#   permitted = [:user_id, :product_id, :product_qty]
	#   permitted << :other if params[:action] == 'create' && current_user.admin?
	#   permitted
	# end
	 permit_params :user_id, :product_id, :product_qty

		# index do
		#     column :id
		#     column :user_id
		#     column :product_id
		#     column :product_qty
		# end
	
end
