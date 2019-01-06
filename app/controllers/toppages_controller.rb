class ToppagesController < ApplicationController
  def index
    @areas = Area.all
    @events = Event.where(id: Event.all.to_a.delete_if{|o| o.event_start - DateTime.now.in_time_zone('Tokyo') < 0 }.pluck(:id))
    @events = @events.where(area_id: params[:event][:area_id]) if params[:event] && params[:event][:area_id].present?
    @events = @events.where(prefecture_id: params[:event][:prefecture_id]) if params[:event] && params[:event][:prefecture_id].present?
    @prefectures = Prefecture.all
    @prefectures = @prefectures.where(area_id: params[:event][:area_id]) if params[:event] && params[:event][:area_id].present?
    @finished_events = Event.where(id: Event.all.to_a.delete_if{|o| o.event_start - DateTime.now.in_time_zone('Tokyo') > 0 }.pluck(:id))
  end
end