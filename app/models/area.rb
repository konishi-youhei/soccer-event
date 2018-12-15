class Area < ApplicationRecord
  has_many :prefectures
  has_many :events
  
  validates :content, presence: true, length: { maximum: 255 }
end
