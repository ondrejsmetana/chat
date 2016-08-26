class RoomsController < ApplicationController

  def index
  @rooms = Room.all
  end

  def new 
  @room = Room.new
  end

  def show
    @room=Room.includes(:messages).find_by(id: params[:id])
    @message = Message.new
  end

  def create
    @room = current_user.rooms.build(room_params)
    if @room.save
      users = User.all
      @room.users=users
      @room.creator = current_user
      @room.save
      flash[:success] = 'Chat room added!'
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def room_params

  	params.require(:room).permit(:name)

  end
end
