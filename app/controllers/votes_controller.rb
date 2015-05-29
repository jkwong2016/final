class VotesController < ApplicationController
	def new
		@message = Message.find_by(id: params["message_id"])
		@uservote = @message.votes.where(user_id: session["user_id"])
		if @uservote.present?
			redirect_to message_url(@message), alert: "Sorry, you can only vote once."
		else
			@vote = Vote.new
			@vote.message_id = params["message_id"]
			@vote.user_id = params["user_id"]
			@vote.save
			redirect_to message_url(@vote.message)
		end
	end

	
end
