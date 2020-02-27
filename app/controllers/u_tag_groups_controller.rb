class UTagGroupsController < ApplicationController
  def update
    u_tag_group = UTagGroup.where(group_id: params[:u_tag_group][:group_id], u_tag_id: params[:u_tag_group][:before_u_tag_id])[0]
    u_tag_group.update(u_tag_id: params[:u_tag_group][:u_tag_id])
    redirect_to root_path

  end
end
