class Episode < ApplicationRecord
  validates :onair_at, presence: true, uniqueness: true
end
