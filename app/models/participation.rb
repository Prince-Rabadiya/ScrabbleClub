class Participation < ApplicationRecord
  belongs_to :game
  belongs_to :player

  validates_presence_of :score, :player_id
  validates_numericality_of :score, only_integer: true
  validate :uniq_player_in_single_game

  def uniq_player_in_single_game
    return unless game.participations.map(&:player_id).count(player.id) == 2

    errors.add :player_id, 'should be different than other one'
  end
end
