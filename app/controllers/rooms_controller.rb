class RoomsController < ApplicationController
	def index
		@rooms = Room.all
	end

	def show
		@room = Room.find_by(id: params["id"])
	end

	def new
		@room = Room.new
	end

	def create
		@room = Room.create(params["room"])
		@room.save
		redirect_to room_url(@room)
	end


end
