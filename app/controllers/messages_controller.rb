class MessagesController < ApplicationController

  def create
    room = Room.find(params[:room_id])
    @message = room.messages.build(message_params)
    @message.user_id=current_user.id
    if @message.save
      flash[:success] = 'Message added!'
      redirect_to controller: 'rooms', action: 'show', id: room.id
    end
  end
  
  private

  def message_params
  	params.require(:message).permit(:text)
  end
end
