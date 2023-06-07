class ProductsController < ApplicationController
	before_action :authorize_request, except: [:index, :show]
	before_action :is_admin , only: [:create, :update, :destroy, :current_user_products]
	before_action :find_product, only: [:show, :update, :destroy]

	def index
		@products = Product.page params[:page]
	end

	def show 
	end

	def create 
		byebug
		product = @current_user.products.new(product_params)
		if product.save 
			render json: {:message => "product created successfully",:data => product} 
		else
			render json: {:errors => product.errors.full_messages }
		end
	end

	def update  
		byebug
		if @product.update(product_params)
			render json: {message: "product updated successfully",:data => product}
		else
			render json: {errors: product.errors.full_messages}
		end
	end

	def destroy 
		@product.destroy
		redirect_to products_path
		# render json: {:message => 'product deleted',:data => product}
	end

	def current_user_products 		
			products = @current_user.products.all
			if products
				render json: products
			else
				render json: 'product not found'
			end
	end

	private 

	def product_params
		params.require(:product).permit(:name,:price,:product_type)
	end

	def is_admin
		if !(@current_user.is_admin)
			# render json: 'you are not allowed to perform that action'
			flash[:alert] = "you are not allowed to perform that action"
			redirect_to product_path
		end
	end

	def find_product
		begin
		@product = Product.find(params[:id])
		rescue ActiveRecord::RecordNotFound
    	render json:  "#No such record in User for id :: #{params[:id]} on #{action_name}" and return
		end
	end

end
