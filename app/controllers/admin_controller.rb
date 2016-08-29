class AdminController < ApplicationController
	before_action :admin_user

	def index
		@avatars = Avatar.all
	end
end
