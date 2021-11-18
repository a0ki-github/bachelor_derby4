class User < ApplicationRecord
  include JwtToken
  has_many :bettings, dependent: :destroy
  has_many :candidates, through: :bettings

  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :name, uniqueness: true, presence: true, length: { maximum: 255 }

  enum role: { general: 0, admin: 1 }

  def current_candidate
    bettings.last.candidate if bettings.any?
  end

  def points
    points = 100

    # 初回放送以降にBETを変更したユーザーに対し減点
    if bettings.before_onair.any?
      points -= (bettings.after_onair.count) * 10
    elsif bettings.after_onair.any?
      points -= (bettings.after_onair.count - 1) * 10
    end

    # 各放送回終了時、脱落した候補者にBETしているor誰にもBETしていないユーザーに対し減点
    [*1..Episode.count - 1].each do |n|
      points -= 20 if after(Episode.nth(n)) && wrong_betting_at_episode(n)
    end

    return points
  end

  def bettings_count
    bettings.count
  end

  private

  def after(episode)
    Time.current > episode.onair_at
  end

  def wrong_betting_at_episode(episode_number)
    return true if bettings.none?
    current_candidate.episodes.count < episode_number + 1
  end
end
