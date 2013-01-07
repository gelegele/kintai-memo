class SessionsController < ApplicationController
  skip_filter :authenticate

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to time_records_url
    else
      redirect_to login_url, :notice => "Incorrect"
    end
  end

  def destroy
    reset_session
    redirect_to login_url, :notice => "Logged out"
  end
end
