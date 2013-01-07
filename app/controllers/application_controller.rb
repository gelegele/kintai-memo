class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate
  helper_method :current_user

  private
  def authenticate
    current_user = User.find(session[:user_id]) if session[:user_id]
    unless current_user
      reset_session
      flash[:referer] = request.fullpath
      redirect_to login_url, :notice => "Not authnticated"
    end
  end

  private
  def current_user
    @current_user = User.find(session[:user_id]) if session[:user_id]
  end
end
