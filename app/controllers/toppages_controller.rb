class ToppagesController < ApplicationController
  before_action :move_to_login
  def index
    @u_tags = UTag.where(user_id: current_user.id).page(params[:page]).per(6)
    @u_tag = UTag.new
  end

  def search
    @messages = Message.order("created_at DESC").first(100)
    return nil if params[:user_keyword] == ""
    @users = User.where(['account_id LIKE ?', "%#{params[:user_keyword]}%"] )

    respond_to do |format|
      format.html
      format.json
    end
  end

  def search1
    return nil if params[:group_keyword] == ""
    @groups = current_user.groups.where(['name LIKE ?', "%#{params[:group_keyword]}%"] )
    respond_to do |format|
      format.html
      format.json
    end
  end

  def search2
    return nil if params[:message_keyword] == ""
    @messages = current_user.groups.messages.where(['message LIKE ?', "%#{params[:message_keyword]}%"] )
    respond_to do |format|
      format.html
      format.json
    end
  end

  private

  def move_to_login
    redirect_to new_user_session_path unless user_signed_in?
  end
end
