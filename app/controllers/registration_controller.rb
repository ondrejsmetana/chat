# app/controllers/registrations_controller.rb
class RegistrationController < Devise::RegistrationsController
	private

	def sign_up_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation, :remember_me, :avatar, :avatar_cache)
	end

	def account_update_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password,:remove_avatar, :avatar, :avatar_cache)
	end
end