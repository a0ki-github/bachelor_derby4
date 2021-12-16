class Episode < ApplicationRecord
  has_and_belongs_to_many :candidates

  validates :onair_at, presence: true

  def self.nth(n)
    order(onair_at: :asc)[n-1]
  end
end
