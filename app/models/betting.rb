class Betting < ApplicationRecord
  belongs_to :user
  belongs_to :candidate

  scope :before_onair, ->(n) { where('created_at < ?', Episode.nth(n).onair_at) }
  scope :after_onair, ->(n) { where('created_at >= ?', Episode.nth(n).onair_at) }
end
