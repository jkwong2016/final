class RepliesController < ApplicationController
	def index
		@replies = Reply.all
	end

	def show
		@reply = Reply.find_by(id: params["id"])
	end

	def new
		@reply = Reply.new
	end

	def create
		@reply = Reply.new(params["reply"])
		@reply.message_id = params["message_id"]
		@reply.save
		redirect_to message_url(@reply.message)
	end

end
