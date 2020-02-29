class GroupUsersController < ApplicationController

  def create
    subscribe = GroupUser.create( sub_params )
    redirect_to :back
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
