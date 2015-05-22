class User < ActiveRecord::Base
	has_many :messages
	has_many :replies
	has_many :affiliations
	has_many :rooms, through: :affiliations

	has_secure_password
end
