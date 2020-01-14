class GroupUsersController < ApplicationController

  def create
    binding.pry
    subscribe = GroupUser.create( sub_params )
##    if subscribe.save
##      follow = GroupFollower.where( group_id: params[:group_user][:group_id], follower_id: params[:group_user][:user_id] ).first
##      if follow
##        follow.destroy
##      end
    redirect_to :back
    end
  end

  def destroy
    member = GroupUser.find(params[:id])
    unsubscribe = member.destroy
    if unsubscribe.destroy
      redirect_to :back
    end
    

  end

  private
  
  def sub_params
    params.require(:group_user).permit(:group_id, :user_id)
  end

end
