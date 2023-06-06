class UsersController < ApplicationController
	protect_from_forgery with: :null_session
	before_action :authorize_request, except: [:create, :new]
	before_action :find_user ,only: [:show, :update, :destroy]

	def index
		# users = User.all
		users = User.page params[:page]
		if users 
			render json: users
		else 
			render json: {:message => 'no record found'}
		end
	end

	def new
		@user = User.new
	end

	def show
		render json: @user
	end

	def profile
		@user = User.find(@current_user.id)
	end

	def create
		byebug
		user = User.new(user_params)
		if user.save 
			redirect_to "/login"
			# redirect_to login_path
			# render :login
		else
			render json: {:error => user.errors.full_messages }
		end
	end

	def update
		if user.update(user_params)
			render json: user
		else
			render json: {:error => user.errors.full_messages }
		end
	end

	def destroy 
		user.destroy
		render json: {:message => 'user deleted'}
	end

	private

	def user_params
		params.require(:user).permit(:name,:email,:contact,:address,:password,:is_admin)
	end

	def find_user
		begin
		@user = User.find(params[:id])
		rescue ActiveRecord::RecordNotFound
		render json:  "#No such record in User for id ::  #{params[:id]} on #{action_name}" and return
		end
	end

end
