class GroupsController < ApplicationController
  before_action :set_group, only: [:edit, :update, :show, :album]
  before_action :move_to_root, except: [:new, :create]
  def new
    @group = Group.new
    @group.users << current_user
  end

  def create
    @group = Group.create( group_params )
    UTagGroup.create(u_tag_id: params[:group][:u_tag_ids], group_id: @group.id)
    if @group.save
      redirect_to group_messages_path(@group)
    else
      render :new
    end
  end

  def edit

  end

  def update
    @group.update(group_params)
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

  def album
    @group = Group.find(params[:id])
    @messages = @group.messages
  end

  private

  def group_params
    params.require(:group).permit(:name, :image, :owner_id, user_ids: [] )
  end
 

  def set_group
    @group = Group.find(params[:id])
  end

  def move_to_root
    redirect_to root_path unless @group.users.includes(current_user)
  end

end
