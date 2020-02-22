class GoodsController < ApplicationController
  
  def toggle
    message = Message.find(params[:message_id])
    @message_id = params[:message_id]
    @user_id = current_user.id
    if current_user.alreadyGood?(message)
      good = Good.where(message_id: params[:message_id], user_id: params[:user_id]).destroy_all
      redirect_to :back
    else
      Good.create(message_id: params[:message_id], user_id: params[:user_id])
      redirect_to :back
    end
    
  end

  private

  def move_to_sign
    redirect_to new_user_registration_path unless user_signed_in?
  end

end
