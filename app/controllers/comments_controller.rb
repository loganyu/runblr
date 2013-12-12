class CommentsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create]

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params[:comment])
    @comment.user = current_user

    if @comment.save
      redirect_to :back
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to :back
    end
  end

  def new
    render :new
  end

end
