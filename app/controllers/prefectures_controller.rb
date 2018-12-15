class PrefecturesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    @prefecture = current_user.prefectures.build(prefecture_params)
  end

  def destroy
  end
  
  def sort
    @prefectures = Prefecture.where(area_id: params[:area_id])
  end
  
  def prefecture_params
    params.require(:prefecture).permit(:content)
  end
end
