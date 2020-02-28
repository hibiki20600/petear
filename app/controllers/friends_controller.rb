class FriendsController < ApplicationController
  def create
    friend = Friend.create(user_id: params[:user_id], friend_id: params[:friend_id])
    if friend.save
      freriqu = Freriqu.where(invite_id: params[:friend_id], invited_id: params[:user_id])[0]
      freriqu.destroy
      redirect_to user_path(params[:friend_id])
    end
  end

  private


end
