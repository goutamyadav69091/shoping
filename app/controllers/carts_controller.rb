class CartsController < ApplicationController
	before_action :authorize_request

	def index 
		cart = @current_user.carts
		# cart = Cart.joins(:product, :user).where(user: {:id => @current_user.id}).select('products.* , carts.*')
		if cart 
			render json: cart
		else
			render json: "cart not found"
		end
	end

	def create
		byebug
		cart = @current_user.carts.new(cart_params)
		if cart.save
			render json: cart
		else
			render json: cart.errors.full_messages
		end
	end

	def update
		cart = Cart.find(params[:id])
		if cart.update(cart_params)
			render json: cart
		else
			render json: {:error => user.errors.full_messages }
		end
	end

	def destroy 
		cart = Cart.find(params[:id])
		cart.destroy
		render json: {:message => 'cart deleted'}
	end

	private

	def cart_params
		params.require(:cart).permit(:product_id, :product_qty)
	end

end