class Message < ApplicationRecord
	belongs_to :user
	belongs_to :room
	validates :text, presence: true, length: {minimum: 2, maximum: 1000}
	after_create_commit { MessageAfterSaveJob.perform_later(self) }
	
	def beforeDays
		return created_at.strftime(' %d %B %Y')
	end

	def format_text(message)

		expressions = message.scan(/\[.*?\]/)
		unless expressions.length == 0
			expressions.each do |expression|
				type = expression.scan(/\[(.*?)\"/)[0][0]
				code = expression.scan(/\"(.*?)\"/)[0][0]
				if type.strip == "image"
					avatar = Avatar.find_by_avatar_code(code.strip)
					if !avatar.nil? 
						message = message.sub(expression, ActionController::Base.helpers.image_tag(avatar.image, style: "width:25px;border-radius:50%;"))
					end
				end
			end
		end
		return message
	end
end
