class FreriqusController < ApplicationController
  def create
    freriqu = Freriqu.create( freriqu_params )
    if freriqu.save
      redirect_to :back
    end
  end

  def destroy
    freriqu = Freriqu.find(params[:id])
    freriqu.destroy
    redirect_to :back
  end


  private
  
  def freriqu_params
    params.require(:freriqu).permit(:invited_id, :invite_id)
  end

end
