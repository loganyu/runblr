class UsersController < ApplicationController
  before_filter :authenticate_user!, only: [:dashboard, :settings, :edit]
  before_filter :new_user?, only: [:new, :create]

  def dashboard
    @user = User.find_by_id(params[:user_id])
    @post = Post.new
  end

  def settings
    @user = User.find_by_id(params[:user_id])
  end

  def create
    @user = User.new(params[:user])
    @user.has_profile_picture = false
    if @user.save
      login_user!(@user)

      # @user.send_welcome_email

      redirect_to user_dashboard_url(current_user)
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end

  end

  def new
    @user = User.new
    render :new
  end



  def edit
    @user = User.find_by_id(params[:id])
  end

  def update
    @user = User.find_by_id(params[:id])
    
    if @user.update_attributes(params[:user])
      flash[:notice] = "Settings updated"
      redirect_to :back
    else
      flash.now[:errors] = @user.errors.full_messages
      redirect_to :back
    end

  end

  def show
    @user = User.find_by_id(params[:id])

    if @user
      render :show
    else
      redirect_to user_dashboard_url(current_user)
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to new_session_url
  end

end
