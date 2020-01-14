class ToppagesController < ApplicationController
  def index
    @friends = Group.where(tag: 'friend').order("created_at DESC")
    @family = Group.where(tag: 'family').order("created_at DESC")
    @classmate = Group.where(tag: 'classmate').order("created_at DESC")
    @mate = Group.where(tag: 'mate').order("created_at DESC")
    @high = Group.where(tag: 'high').order("created_at DESC")
    @middle = Group.where(tag: 'middle').order("created_at DESC")
    #@elements = Group.where(tag: 'element').order("created_at DESC")
    #@babies = Group.where(tag: 'baby').order("created_at DESC")
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
