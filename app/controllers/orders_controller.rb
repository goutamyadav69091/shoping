class OrdersController < ApplicationController
	protect_from_forgery with: :null_session
	before_action :authorize_request, except: [:index, :show]
	before_action :is_admin, only: [:update, :destroy]
	
	def index
		@order = Order.all
		render json: @order
	end

	def create
		byebug
		@order = @current_user.orders.new(order_params)
		if @order.save
			render json:{order: @order, payment: @order.payment }
		else
			render json:@order.errors.full_messages
		end
	end
	
	def current_user_orders
		orders = @current_user.orders
		render json: orders
	end

	def update
		byebug
		order = Order.find(params[:id])
		if order.update("order_status":params[:order_status])
			render json:order
		else
			render json:"unable to update"
		end
	end
	
	def destroy
		byebug
		order = Order.find(params[:id])
		if order.update(:order_status => "canceled" )
			render json:order
		else
			render json:"unable to update"
		end
	end

	private 

	def order_params
		params.require(:data).permit(:cart_id,:shiping_address,:billing_address,:amount,:credit_card_number,:credit_card_exp_month,:credit_card_exp_year,:credit_card_cvv)
	end

	def is_admin
		if @current_user.is_admin

		else
			render json: 'you are not allowed to perform that action'
		end
	end

end