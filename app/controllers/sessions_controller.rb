class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to time_records_url
    else
      render "new"
    end
  end

  def destroy
    reset_session
    redirect_to root_url
  end
end
