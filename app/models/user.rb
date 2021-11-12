class User < ApplicationRecord
  include JwtToken
  has_many :bettings, dependent: :destroy
  has_many :candidates, through: :bettings

  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :name, uniqueness: true, presence: true, length: { maximum: 255 }

  def current_candidate
    bettings.last.candidate if bettings.any?
  end

  def points
    points = 100
  end
end
