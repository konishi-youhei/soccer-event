class RankingsController < ApplicationController
  def like
    @ranking_counts = Like.ranking
    @events = Event.where(id: @ranking_counts.keys).where("event_start > ?", Time.now) 
  end
end
