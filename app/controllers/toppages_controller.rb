class ToppagesController < ApplicationController
  def index
    @areas = Area.all
    @events = Event.all#.order('created_at DESC').page(params[:page])
    @events = @events.where(area_id: params[:event][:area_id]) if params[:event] && params[:event][:area_id].present?
    @events = @events.where(prefecture_id: params[:event][:prefecture_id]) if params[:event] && params[:event][:prefecture_id].present?
    @prefectures = Prefecture.all
    @prefectures = @prefectures.where(area_id: params[:event][:area_id]) if params[:event] && params[:event][:area_id].present?
  end
end
