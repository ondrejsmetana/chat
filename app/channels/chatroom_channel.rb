# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_rooms_#{params['room_id']}_channel"
  end

  def unsubscribed
  end

  def speak(data)
    @message = current_user.messages.build(text: data['message'], room_id: data['room_id'])
    @message.save
  end

  def room_user_update(data)
    @room = Room.find(data["room_id"])
    @user = User.find(data["user_id"])

    if !@room.users.include?(@user)
     @room.users << @user
     @room.save
     ActionCable.server.broadcast "chat_rooms_#{data["room_id"]}_channel",
     message: "user #{@user.name} invited into chatroom",
     room_id: data["room_id"],
     notification: true
   end

   
 end
end
