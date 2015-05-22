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
		Message.create(params["message"])
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
