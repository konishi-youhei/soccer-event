class AreasController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    @area = current_user.areas.build(area_params)
  end

  def destroy
  end
  
  def area_params
    params.require(:area).permit(:content)
  end
end
