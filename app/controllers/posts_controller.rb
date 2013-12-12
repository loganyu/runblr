class PostsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :like, :unlike]
  before_filter :post_exists?, only: [:edit, :show, :update, :like, :unlike]
  before_filter :user_owns_post?, only: [:edit, :update]

  def create
    @post = current_user.posts.new(params[:post])
    if @post.save
      redirect_to :back
    else
      flash.now[:errors] = @post.errors.full_messages
      redirect_to :back
    end
  end

  def new
    @post = Post.new
  end

  def edit
    @post = params[:post]
  end

  def show
    @post = Post.find_by_id(params[:id])
  end

  def update
    if @post.update_attributes(params[:post])
      redirect_to :back
    else
      flash.now[:errors] = @post.errors.full_messages
      redirect_to :back
    end
  end

  def destroy
    @post = post
  end

  def like
    like_total(1)
  end

  def unlike
    like_total(0)
  end

  private
    def post_exists?
      @post = Post.includes(:user_post_likes).find_by_id(params[:id])
      redirect_to :back unless @post
    end

    def like_total(direction)
      @user_post_like = UserPostLike.find_by_post_id_and_user_id(@post.id, current_user.id)

      if @user_post_like
        @user_post_like.update_attributes(value: direction)
      else
        @post.user_post_likes.create(user_id: current_user.id, value: direction)
      end

      redirect_to :back
    end

    def user_owns_post?
      redirect_to :back unless @post.user == current_user
    end

end
