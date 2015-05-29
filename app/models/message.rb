class Message < ActiveRecord::Base
	belongs_to :user
	belongs_to :room
	has_many :replies
	has_many :votes
end
