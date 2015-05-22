class SessionsController < ApplicationController
	skip_before_action :auth
  	layout false

  	def create
    @user = User.find_by(email: params["email"])
    if @user.present?
      if @user.authenticate(params["password"])
        session["user_id"] = @user.id
        redirect_to root_url
      else
        redirect_to new_session_url, alert: "Email or password does not match our system"
      end
    else
      redirect_to new_session_url, alert: "Email is not in system"
    end
    # params["email"] => the email address
    # params["password"] => the password
    # Do authentication
    # Redirect to the root_path
    # Display a notice that login was either successful or unsuccessful
  end

  def destroy
    session["user_id"] = nil
    redirect_to root_url, notice: "See you later!"
    # Do sign-out
  end

end
