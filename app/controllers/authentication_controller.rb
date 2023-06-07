class AuthenticationController < ApplicationController
	protect_from_forgery with: :null_session
	before_action :authorize_request, except: [:login, :new]
	
	def new 

	end

	def login
		@user = User.find_by_email(params[:email])
		if @user && @user.password == params[:password]
			token = JsonWebToken.encode(user_id: @user.id)
			time = Time.now + 24.hours.to_i
			session[:token] = token
			redirect_to root_path
			# redirect_to '/products'
			# render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
			# 							 admin: @user.is_admin}, status: :ok
		else
			render json: { error: 'unauthorized' }, status: :unauthorized
		end
	end

	def logout
		session[:token] = nil
		redirect_to root_path
	end

	private

	def login_params
		params.permit(:email, :password)
	end
end
