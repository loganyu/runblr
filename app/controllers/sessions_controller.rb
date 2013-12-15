class SessionsController < ApplicationController
  before_filter :new_user?, only: [:new, :create]
  before_filter :authenticate_user!, only: [:destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email(params[:user][:email])
    if @user && @user.is_password?(params[:user][:password])
      login_user!(@user)
      redirect_to user_dashboard_url(@user)
    else
      flash.now[:errors] = ["Invalid username or password."]
      @user ||= User.new
      render :new
    end
  end

  def destroy
    current_user.reset_session_token!
    session[:token] = nil

    redirect_to new_session_url
  end

end
