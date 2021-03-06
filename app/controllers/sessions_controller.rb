class SessionsController < ApplicationController
  def index
  end

  def new
  end

  def create
    user = User.find_by_email(params[:signin][:email])
    if user && user.authenticate(params[:signin][:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: 'Logged in!'
    else
      flash.now[:alert] = 'Email or password is invalid'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Logged out!'
  end
end
