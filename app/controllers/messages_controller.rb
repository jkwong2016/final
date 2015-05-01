class MessagesController < ApplicationController
	def index
		@messages = Message.all
	end

	def show
		@message = Message.find_by(id: params["id"])
	end
end
