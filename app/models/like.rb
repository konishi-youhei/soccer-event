class Like < ApplicationRecord
  belongs_to :user
  belongs_to :event
  
  def self.ranking
    self.group(:event_id).order('count_event_id DESC').limit(10).count(:event_id)
  end
end
