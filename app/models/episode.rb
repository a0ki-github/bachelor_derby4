class Episode < ApplicationRecord
  has_and_belongs_to_many :candidates

  validates :onair_at, presence: true

  scope :one, -> { find_by(onair_at: Time.new(2021, 11, 25, 22)) }
  scope :two, -> { find_by(onair_at: Time.new(2021, 12, 2, 22)) }
  scope :three, -> { find_by(onair_at: Time.new(2021, 12, 9, 22)) }
  scope :four, -> { where(onair_at: Time.new(2021, 12, 16, 22)).first }
  scope :final, -> { where(onair_at: Time.new(2021, 12, 16, 22)).last }

end
