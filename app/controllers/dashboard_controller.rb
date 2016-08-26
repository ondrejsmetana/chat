class DashboardController < ApplicationController
  def index
  	@rooms=Room.all
  	@rooms=false if @rooms.blank?
  end
end
