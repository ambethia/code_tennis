class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_time_zone
  helper_method :logged_in?, :current_user

  # GET /
  def index
    render :template => "layouts/splash", :layout => false
  end

  protected

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

    def set_time_zone
      Time.zone = current_user.time_zone if logged_in?
    end

end
