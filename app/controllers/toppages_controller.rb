class ToppagesController < ApplicationController
  def index
    @animals = Group.where(tag: 'animal').order("created_at DESC")
    @sea = Group.where(tag: 'sea').order("created_at DESC")
    @camp = Group.where(tag: 'camp').order("created_at DESC")
    @forest = Group.where(tag: 'forest').order("created_at DESC")
    @foods = Group.where(tag: 'food').order("created_at DESC")
    @yours = Group.where(tag: 'your group').order("created_at DESC")
  end

  

end
