class MessagesController < ApplicationController
	# skip_before_action :auth, only: [:new]

	def index
		@messages = Message.all
	end

	def show
		@message = Message.find_by(id: params["id"])
	end

	def new
		@message = Message.new
	end

	def create
		@message = Message.create(params["message"])
		@message.room_id = params["room_id"]
		# @message.user_id = session["user_id"]
		@message.user = current_user
		@message.save
		@affiliation = Affiliation.new
		@affiliation.user_id = session["user_id"]
		@affiliation.room_id = params["room_id"]
		@affiliation.save
		redirect_to messages_url
	end

	def edit
		@message = Message.find_by(id: params["id"])

	end

	def update
		Message.find_by(id: params['id']).update(params['message'])
		redirect_to messages_url
	end

	def destroy
		Message.find_by(id: params['id']).delete
		redirect_to messages_url
	end
end
