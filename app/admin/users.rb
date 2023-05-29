ActiveAdmin.register User do
  #app/admin/clients.rb

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :email, :address, :contact, :password, :is_admin]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

    # actions :index, :edit, :update, :create, :destroy, :new

    permit_params :name, :email, :address, :contact, :password, :is_admin

    # index do
    #     column :id
    #     column :name
    #     column :address
    #     column :email
    #     column :contact    
    #     column :is_admin   
    #     column :password   
    # end

   filter :name
   filter :email

   # controller { actions :all, except: [:destroy] }

end

