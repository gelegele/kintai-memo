class SessionsController < ApplicationController
  skip_filter :authenticate

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:remember_me] = params[:remember_me]
      update_session_expire
      redirect_to params[:referer]
    else
      flash[:error] = "Incorrect"
      flash[:email] = params[:email]
      flash[:password] = params[:password]
      flash[:remember_me] = params[:remember_me]
      redirect_to login_url
    end
  end

  def destroy
    reset_session
    redirect_to login_url, :notice => "Logged out"
  end
end
