class ToppagesController < ApplicationController
  def index
    group = Group.includes(:messages).all
    @animals = group.where(tag: 'animal').order("RAND()").first(10)
    @sea = group.where(tag: 'sea').order("RAND()").first(10)
    @camp = group.where(tag: 'camp').order("RAND()").first(10)
    @mate = group.where(tag: 'mate').order("RAND()").first(10)
    @high = group.where(tag: 'high').order("RAND()").first(10)
    @uni = group.where(tag: 'universaly').order("RAND()").first(10)
    
  end

  def search
    @messages = Message.order("created_at DESC").first(100)
    return nil if params[:user_keyword] == ""
    if user_signed_in?
      @users = User.where(['name LIKE ?', "%#{params[:user_keyword]}%"] ).where.not(id: current_user.id)
    else
      @users = User.where(['name LIKE ?', "%#{params[:user_keyword]}%"] )
    end

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
