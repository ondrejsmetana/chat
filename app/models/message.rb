class Message < ApplicationRecord
	belongs_to :user
	belongs_to :room
	validates :text, presence: true, length: {minimum: 2, maximum: 1000}
	after_create_commit { MessageAfterSaveJob.perform_later(self) }
	
	def beforeDays
		return created_at.strftime(' %d %B %Y')
	end
end
