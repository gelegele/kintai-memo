class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate
  helper_method :current_user, :update_session_expire

  private
  def authenticate
    current_user = User.find(session[:user_id]) if session[:user_id]
    if current_user
      update_session_expire
    else
      reset_session
      flash[:referer] = request.fullpath
      redirect_to login_url, :notice => "Not authnticated"
    end
  end

  private
  def current_user
    @current_user = User.find(session[:user_id]) if session[:user_id]
  end

  private
  def update_session_expire
    request.session_options[:expire_after] = session[:remember_me] ? 10.days : nil
  end
end
