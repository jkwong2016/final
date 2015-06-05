class RepliesController < ApplicationController
	def index
		@replies = Reply.all
	end

	def show
		@reply = Reply.find_by(id: params["id"])
	end

	def new
		# @reply = Reply.new
	end

	def create
		@reply = Reply.new(params["reply"])

		@message = Message.find_by(id: params["message_id"])

		if @reply.body.blank?
			redirect_to message_url(@message), alert: "Reply cannot be blank"
		else
			@reply.message = @message
			@reply.user = current_user
			@reply.save
			redirect_to message_url(@message)
		end
		# @reply.message_id = params["message_id"]
		# @reply.user_id = session["user_id"]
		# @reply.save
		# redirect_to message_url(@reply.message)
	end

end
