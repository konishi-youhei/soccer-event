class RelationshipsController < ApplicationController
  before_action :require_user_logged_in

  def create
    event = Event.find(params[:event_id])
    current_user.like(event)
    flash[:success] = 'イベントをお気に入りしました。'
    redirect_back(fallback_location: root_url)
  end

  def destroy
    event = Event.find(params[:event_id])
    current_user.unlike(event)
    flash[:success] = 'イベントのお気に入りを解除しました。'
    redirect_back(fallback_location: root_url)
  end
end
