class Prefecture < ApplicationRecord
  belongs_to :area
  has_many :events
  
  validates :content, presence: true, length: { maximum: 255 }
end
