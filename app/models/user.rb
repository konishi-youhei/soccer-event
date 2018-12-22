class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  has_many :events
  
  has_many :likes
  has_many :like_events, through: :likes, source: :event
  
  def like(event)
    self.likes.find_or_create_by(event_id: event.id)
  end

  def unlike(event)
    like = self.likes.find_by(event_id: event.id)
    like.destroy if like
  end

  def like_event?(event)
    self.like_events.include?(event)
  end
end