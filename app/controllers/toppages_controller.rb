class ToppagesController < ApplicationController
  def index
    group = Group.includes(:messages).all
    @friends = group.where(tag: 'friend').order("RAND()")
    @family = group.where(tag: 'family').order("RAND()")
    @classmate = group.where(tag: 'classmate').order("RAND()")
    @mate = group.where(tag: 'mate').order("RAND()")
    @high = group.where(tag: 'high').order("RAND()")
    @middle = group.where(tag: 'middle').order("RAND()")
    
  end

  def search
    @messages = Message.order("created_at DESC").first(100)
    return nil if params[:user_keyword] == ""
    @users = User.where(['name LIKE ?', "%#{params[:user_keyword]}%"] ).where.not(id: current_user.id)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def search1
    return nil if params[:group_keyword] == ""
    @groups = Group.where(['name LIKE ?', "%#{params[:group_keyword]}%"] )
    respond_to do |format|
      format.html
      format.json
    end
  end

  def search2
    return nil if params[:message_keyword] == ""
    @messages = Message.where(['message LIKE ?', "%#{params[:message_keyword]}%"] )
    respond_to do |format|
      format.html
      format.json
    end
  end
end
