class Reply < ActiveRecord::Base
	belongs_to :message
	belongs_to :user
	has_many :votes
end
