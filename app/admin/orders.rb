ActiveAdmin.register Order do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :cart_id, :user_id, :shiping_address, :billing_address, :payment_mode, :order_status
  #
  # or
  #
  # permit_params do
  #   permitted = [:cart_id, :user_id, :shiping_address, :billing_address, :payment_mode, :order_status]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
   permit_params :cart_id ,:user_id,:shiping_address,:billing_address,:payment_mode,:order_status

    # index do
    #     column :id
    #     column :name
    #     column :address
    #     column :email
    #     column :contact    
    #     column :is_admin   
    #     column :password   
    # end
end
