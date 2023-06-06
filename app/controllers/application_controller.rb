# class ApplicationController < ActionController::API
class ApplicationController < ActionController::Base
	# protect_from_forgery with: :null_session
	require "json_web_token"
	# require "authentication_controller.rb"
	def not_found
		render json: { error: 'not_found' }
	end

	def authorize_request
		if request.headers['Authorization']
			header = request.headers['Authorization']
			header = header.split(' ').last if header
		else
			header = session[:token]
			puts header
	  end
		begin
			decoded = JsonWebToken.decode(header)
			@current_user = User.find(decoded[:user_id])
		rescue ActiveRecord::RecordNotFound => e
			render json: { errors: e.message }, status: :unauthorized
		rescue JWT::DecodeError => e
			render json: { errors: e.message }, status: :unauthorized
		end
		# byebug
		puts @current_user
	end

end
