class Event < ApplicationRecord
  belongs_to :user
  belongs_to :area
  belongs_to :prefecture
  
  validates :content, presence: true, length: { maximum: 255 }
  validates :charge, presence: true, length: { maximum: 50 }
  validates :number_of_people, presence: true, length: { maximum: 50 }
  validates :event_start, presence: true, length: { maximum: 50 }
  validates :event_end, presence: true, length: { maximum: 50 }
  validates :title, presence: true, length: { maximum: 50 }
  validates :url, presence: true, length: { maximum: 255 }
end
