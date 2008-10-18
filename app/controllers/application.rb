# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :logged_in?, :current_user

  def logged_in?
    !!current_user # tisk, tisk
  end

  def current_user
    @current_user ||= self.current_user = User.find_by_id(session[:user_id])
  end

  def current_user=(user)
    session[:user_id] = user ? user.id : nil
    @current_user = user || false
  end

end
