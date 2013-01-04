class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      render text:'Logged in.'
    else
      render "new"
    end
  end
end
