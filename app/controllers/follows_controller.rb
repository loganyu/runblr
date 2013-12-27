class FollowsController < ApplicationController
  def create
    runner_followee_id = params[:user_id]
    runner_follower_id = current_user.id
    @user = current_user

    @follow = Follow.new(runner_followee_id: runner_followee_id, runner_follower_id: runner_follower_id)
    # if @follow.save
    #   redirect_to :back
    # else
    #   flash[:errors] = @follow.errors.full_messages
    #   redirect_to :back
    # end

    if @follow.save
      respond_to do |format|
        format.html { render partial: 'users/right_column_template', current_user: current_user }
      end
    end

  end

  def destroy
    follow = Follow.find_by_runner_followee_id_and_runner_follower_id(
      params[:user_id], params[:id])
    
    # redirect_to :back
    if follow.destroy
      respond_to do |format|
        format.html { render partial: 'users/right_column_template', current_user: current_user }
      end
    end

  end
  
end
