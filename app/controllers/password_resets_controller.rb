class PasswordResetsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email(params[:email])
    if !!@user
      @user.send_password_reset
      flash.now[:errors] = ["Password reset sent"] # notice
      redirect_to new_session_url
    else
      flash.now[:errors] = ["No user found with that email"]
      @user = User.new
      render :new
    end
  end

  def edit
    @user = User.find_by_password_reset_token(params[:reset_token])
  end

  def update
    @user = User.find_by_password_reset_token(params[:reset_token])
    if !!@user && @user.update_attributes(params[:user])
      flash.now[:errors] = ["Password has been reset"]
      redirect_to new_session_url
    else
      flash.now[:errors] = ["Unable to reset password"]
      redirect_to new_session_url
    end
  end
end