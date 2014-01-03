class PostsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :like, :unlike]
  before_filter :post_exists?, only: [:edit, :show, :update, :like, :unlike]
  before_filter :user_owns_post?, only: [:edit, :update]

  def create
    @post = current_user.posts.new(params[:post])
    if @post.save
      redirect_to :back
    #   respond_to do |format|
    #     format.html { render partial: "new_post_template", post: @post}
    #   end
    # end
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to :back
      # head :ok
    end
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find_by_id(params[:post][:id])
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
    @post = Post.find_by_id(params[:id])
    @post.delete
    
    head :ok
  end

  def like
    @post = Post.find_by_id(params[:id])
    like_total(1)

    respond_to do |format|
      format.html { render partial: "likes_information", post: @post}
    end
  end

  def unlike
    @post = Post.find_by_id(params[:id])

    like_total(0)

    respond_to do |format|
      format.html { render partial: "likes_information", post: @post}
    end
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

      # redirect_to :back
    end

    def user_owns_post?
      redirect_to :back unless @post.user == current_user
    end
    

end
