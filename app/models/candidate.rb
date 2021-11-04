class Candidate < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { maximum: 255 }
  validates :age, presence: true
  validates :title, presence: true, length: { maximum: 255 }
  validates :youtube_url, presence: true
end
