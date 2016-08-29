class DashboardController < ApplicationController
  def index
  	@rooms=Room.all
  	@rooms=false if @rooms.blank?
  	@room_count = @rooms.length
  end
end
