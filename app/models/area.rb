class Area < ApplicationRecord
  has_many :prefectures
  
  validates :content, presence: true, length: { maximum: 255 }
end
