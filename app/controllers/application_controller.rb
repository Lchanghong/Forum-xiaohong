class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  

  

  before_action :check_login 

  def check_login
  	logger.debug "session user_id: %s" % session[:user_id].inspect
    unless session[:user_id]
      flash[:notice] = "请登录!"
      redirect_to new_session_url and return
    end
  end


end
