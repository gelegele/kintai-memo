class SessionsController < ApplicationController
  skip_filter :authenticate

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to params[:referer]
    else
      flash[:error] = "Incorrect"
      redirect_to login_url
    end
  end

  def destroy
    reset_session
    redirect_to login_url, :notice => "Logged out"
  end
end
