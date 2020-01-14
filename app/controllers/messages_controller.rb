class MessagesController < ApplicationController
  before_action :set_group
  before_action :move_to_root

  def index
    @message = Message.new
    @messages = @group.messages.includes(:user)
  end

  def create
    @message = @group.messages.create(message_params)
    respond_to do |format|
      format.html 
      format.json
    end
  end


  private

  def message_params
    params.require(:message).permit(:message, :image, :video).merge( user_id: current_user.id )
  end

  def set_group
    @group = Group.find(params[:group_id])
  end
  
  def move_to_root
    redirect_to new_user_registration_path unless user_signed_in?
  end
  
end
