class FollowsController < ApplicationController
  def create
    runner_followee_id = params[:user_id]
    runner_follower_id = current_user.id

    @follow = Follow.new(runner_followee_id: runner_followee_id, runner_follower_id: runner_follower_id)
    # if @follow.save
    #   redirect_to :back
    # else
    #   flash[:errors] = @follow.errors.full_messages
    #   redirect_to :back
    # end

    @follow.save!

    head :ok

  end

  def destroy
    follow = Follow.find_by_runner_followee_id_and_runner_follower_id(
      params[:user_id], params[:id])
    follow.destroy
    # redirect_to :back

    head :ok

  end
end
