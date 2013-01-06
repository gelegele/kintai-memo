class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render text:'Logged in.'
    else
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
