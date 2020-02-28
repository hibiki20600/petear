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
    @friends = []
    @user.friend.each do |friend|
      unless friend.id == @user.id
        @friends << friend
      end
    end
    @user.inverse_friend.each do |friend|
      unless friend.id == @user.id
        @friends << friend
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :image, :email, :comment, :account_id)
  end
  
  
end
