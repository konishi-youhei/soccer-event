class EventsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def new
    if logged_in?
      @event = current_user.events.build  # form_for 用
      @areas = Area.all
      @prefectures = params[:event] ? Prefecture.where(area_id: params[:event][:area_id]) : []
    end
  end
  
  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = 'イベントを投稿しました。'
      redirect_to root_url
    else
      @areas = Area.all
      @prefectures = Prefecture.where(area_id: params[:event][:area_id])
      flash.now[:danger] = 'イベントの投稿に失敗しました。'
      render 'events/new'
    end
  end

  def destroy
    @event.destroy
    flash[:success] = 'イベントを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def event_params
    params.require(:event).permit(:area_id, :prefecture_id, :content, :charge, :number_of_people, :event_start, :event_end, :title, :url)
  end
  
  def correct_user
    @events = current_user.events.find_by(id: params[:id])
    unless @event
      redirect_to root_url
    end
  end
end
