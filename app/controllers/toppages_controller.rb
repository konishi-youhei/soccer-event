class ToppagesController < ApplicationController
  def index
    @areas = Area.all
    @events = Event.all.order('created_at DESC').page(params[:page])
    @events = @events.where(area_id: params[:q][:area_id]) if params[:q] && params[:q][:area_id].present?
  end
end
