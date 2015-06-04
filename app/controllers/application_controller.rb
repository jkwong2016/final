class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user    # allows you to use the "current_user" method in the view
  before_action :auth    # "auth" can be named anything 

  def auth
 	if current_user
 	else
 		redirect_to new_session_url
 	end
  end

  def current_user
	   User.find_by(id: session["user_id"])  	
  end

  def edit
    session[:return_to] ||= request.referer
  end

end

#gatekeeper action 