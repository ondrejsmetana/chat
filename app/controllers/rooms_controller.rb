class RoomsController < ApplicationController
  before_filter :authenticate_user

  def index
    @rooms = Room.all
  end

  def new 
    @room = Room.new
  end

  def show
    @room=Room.includes(:messages).includes(:roomusers).find_by(id: params[:id])
    invited_user!(@room)
    @message = Message.new
    excludeIds =  @room.users.ids << @room.creator.id
    @to_invite = User.where.not(id: excludeIds)
  end

  def create
    @room = current_user.rooms.build(room_params)
    if @room.save
      @room.creator = current_user
      @room.save
      flash[:success] = 'Chat room added!'
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to root_path
  end

  private

  def room_params

  	params.require(:room).permit(:name)

  end

  def invited_user!(room)

    unless room.users.include?(current_user) || current_user==room.creator
      redirect_to root_path, :notice => 'You were not invited to this chatroom'
    end
  end
end
