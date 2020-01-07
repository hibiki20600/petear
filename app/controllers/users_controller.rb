class UsersController < ApplicationController

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @user = User.find( params[:id] )
    @followings = GroupFollower.where(follower_id: @user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :image, :email, :comment)
  end
  
  
end
