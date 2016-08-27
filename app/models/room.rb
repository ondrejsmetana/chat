class Room < ApplicationRecord
	belongs_to :creator, :class_name => "User", :foreign_key => "user_id"
	has_many :messages , dependent: :destroy
	has_many :roomusers, dependent: :destroy
	has_many :users, :through => :roomusers
	validates :name, presence: true, length: {minimum: 2, maximum: 1000}

	
  def update_users

  end
  
end
