class ToppagesController < ApplicationController
  def index
    group = Group.includes(:messages).all
    @animals = group.where(tag: 'animal').order("RAND()")
    @sea = group.where(tag: 'sea').order("RAND()")
    @camp = group.where(tag: 'camp').order("RAND()")
    @mate = group.where(tag: 'mate').order("RAND()")
    @high = group.where(tag: 'high').order("RAND()")
    @uni = group.where(tag: 'universaly').order("RAND()")
    
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
