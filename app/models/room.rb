class Room < ActiveRecord::Base
	has_many :messages
	has_many :affiliations
	has_many :users, through: :affiliations
end
