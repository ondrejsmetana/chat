class MessageAfterSaveJob < ActiveJob::Base
	queue_as :default
	include Rails.application.routes.url_helpers

	def perform(message)

		ActionCable.server.broadcast "chat_rooms_#{message.room_id}_channel",
		message: render_message(message),
		room_id: message.room_id
	end

	private

	def render_message(message)
		ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message }) 
	end
end
					