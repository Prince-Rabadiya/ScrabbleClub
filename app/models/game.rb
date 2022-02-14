class Game < ApplicationRecord
  has_many :participations, dependent: :destroy
  has_many :players, through: :participations

  accepts_nested_attributes_for :participations, allow_destroy: true

  validates :name, presence: true, uniqueness: true

  def winner
    return if participations.first.score == participations.last.score

    participations.order(:score).last.player
  end
end
