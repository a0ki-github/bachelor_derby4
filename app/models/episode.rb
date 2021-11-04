class Episode < ApplicationRecord
  has_and_belongs_to_many :candidates

  validates :onair_at, presence: true
end
