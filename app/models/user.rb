class User < ActiveRecord::Base
	has_many :messages
	has_many :replies
	has_many :votes
	has_many :affiliations
	has_many :rooms, through: :affiliations

  	# validates_format_of :email, with: "kellogg.northwestern.edu", on: :create
  	validates :email, presence: true
  	validates :password, presence: true
	has_secure_password
end
