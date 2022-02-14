class LeaderBoardsController < ApplicationController
  def index
    eligible_player_ids = Player.joins(:participations).group('id')
                                .having('count(participations.id) >= 10')
                                .pluck(:id)
    @leader_board_scores = {}
    Player.where(id: eligible_player_ids).includes(:participations).each do |player|
      games_played = player.participations.count
      @leader_board_scores[player.id] = [games_played,
                                         player.participations.pluck(:score).sum
                                               .to_f / games_played]
    end
    @leader_board_players = {}
    @leader_board_scores.sort_by { |_k, v| v }.reverse.first(10)
                        .each { |k, v| @leader_board_players[Player.find(k)] = v }
  end
end
