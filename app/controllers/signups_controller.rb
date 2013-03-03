class SignupsController < ApplicationController
  skip_filter :authenticate

  def new
  end

  def create
    if User.find_by_email(params[:email])
      flash[:error] = 'This email is already taken.'
    else
      @user = User.new
      @user.email = params[:email]
      @user.password = params[:password]
      @user.password_confirmation = params[:password_confirmation]
      unless @user.save
        p @user.errors #TODO error messages
        flash[:error] = 'Failed!'
      end
    end

    respond_to do |format|
      unless flash[:error]
        session[:user_id] = @user.id
        format.html { redirect_to time_records_url }
      else
        flash[:email] = params[:email]
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end
