class Betting < ApplicationRecord
  belongs_to :user
  belongs_to :candidate

  scope :before_onair, -> { where('created_at < ?', Episode.nth(1).onair_at) }
  scope :after_onair, -> { where('created_at >= ?', Episode.nth(1).onair_at) }
end
