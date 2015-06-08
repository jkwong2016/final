class SessionsController < ApplicationController
	skip_before_action :auth
  	layout false

  	def create
    @user = User.find_by(email: params["email"])
    if @user.present?
      # Yes, the user exists
      if @user.authenticate(params["password"])
        session["user_id"] = @user.id
        redirect_to root_url
      else
        redirect_to new_session_url, alert: 'Email or password does not match our system'
      end
    else
      # No user with that email
      redirect_to new_session_url, alert: 'Email or password does not match our system'
    end
  end

  def destroy
    session["user_id"] = nil
    redirect_to root_url, notice: "See you later!"
  end

end
