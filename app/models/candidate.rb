class Candidate < ApplicationRecord
  has_and_belongs_to_many :episodes
  has_many :bettings, dependent: :destroy
  has_many :users, through: :bettings

  validates :name, presence: true, uniqueness: true, length: { maximum: 255 }
  validates :age, presence: true
  validates :title, presence: true, length: { maximum: 255 }
  validates :youtube_url, presence: true

  scope :lost_in_episode, ->(episode) { all - Episode.send(episode).candidates }
end
