class GroupFollowersController < ApplicationController

  def create
    following = GroupFollower.create( follower_params )
    if following.save
      redirect_to :back
    end
  end

  def destroy
    group_following = GroupFollower.find(params[:id])
    group_following.destroy
    redirect_to :back
  end


  private
  
  def follower_params
    params.require(:group_follower).permit(:group_id, :follower_id)
  end

end
