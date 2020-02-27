class UsersController < ApplicationController

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(params[:id])
    else
      render :edit
    end
  end

  def show
    @user = User.includes(:groups).find( params[:id] )
    @followings = GroupFollower.where(follower_id: @user.id).includes(:group)
    @user_acquaintance = @user.invited
    @followed = Freriqu.where(invite_id: current_user.id, invited_id: @user.id)[0]
    @following = Freriqu.where(invite_id: @user.id, invited_id: current_user.id)[0]
  end

  private

  def user_params
    params.require(:user).permit(:name, :image, :email, :comment, :account_id)
  end
  
  
end
