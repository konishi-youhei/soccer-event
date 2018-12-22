class RankingsController < ApplicationController
  def like
    @ranking_counts = Like.ranking
    @events = Event.find(@ranking_counts.keys)
  end
end
