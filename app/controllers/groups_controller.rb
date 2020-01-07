class GroupsController < ApplicationController
  before_action :set_group, only: [:edit, :update, :show]

  def new
    @group = Group.new
    @group.users << current_user
  end

  def create
    @group = Group.create( group_params )
    if @group.save
      redirect_to group_messages_path(@group)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @group.update( group_params )
    redirect_to group_messages_path(@group)
  end
  
  def show
    @group_users = @group.group_users.order("created_at ASC")
  end

  def destroy
    group = Group.find(params[:id])
    group.destroy
    redirect_to root_path
  end


  private

  def group_params
    params.require(:group).permit(:name, :image, :tag, :owner_id, user_ids: [] )
  end

  def set_group
    @group = Group.find(params[:id])
  end

  def move_to_root
    redirect_to new_user_registration_path unless user_signed_in?
  end

end
