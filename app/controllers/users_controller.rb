class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def show
		@user = User.find_by(id: params["id"])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.create(params["user"])
		if @user.valid?
			redirect_to @user, noitce: "Your username has been created!"
		else
			render "new"
		end
	end

	def edit
		@user = User.find_by(id: params["id"])
	end

	def update
		@user = User.find_by(id: params["id"])
		@user.update(params["user"])
		redirect_to users_path
	end

	def destroy
		@user = User.find_by(id: params["id"])
		@user.destroy
		redirect_to users_path
	end
end


#sign up a new user