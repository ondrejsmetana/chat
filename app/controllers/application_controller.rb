class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

	protected

	def authenticate_user
		if !user_signed_in?
			redirect_to new_user_session_path, :notice => 'Please login first'
		end
	end

	def admin_user
		if !user_signed_in? || !current_user.admin
			redirect_to root_path, :notice => "Requires admin privileges"
		end
	end
end
