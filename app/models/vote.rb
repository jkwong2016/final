class Vote < ActiveRecord::Base
	belongs_to :message
	belongs_to :reply
	belongs_to :user
end
