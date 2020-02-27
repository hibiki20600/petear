class UTagsController < ApplicationController
  def create
    UTag.create(u_tag_params)
    redirect_to root_path
  end

  private
  def u_tag_params
    params.require(:u_tag).permit(:user_id, :tag)
  end
end
