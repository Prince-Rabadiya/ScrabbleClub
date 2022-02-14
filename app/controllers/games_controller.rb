class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
    @player_details = @game.players.map { |player| [player.name, player.participations.where(game_id: @game.id).first.score] }
    @winner = @game.winner
  end

  def new
    @game = Game.new
    2.times do
      @game.participations.build
    end
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to @game, notice: 'Game created.'
    else
      render :new, alert: "Please review following #{@game.errors.full_messages.join(', ')}"
    end
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    if @game.update(game_params)
      redirect_to @game, notice: 'Game updated.'
    else
      render :edit, alert: "Please review following #{@game.errors.full_messages.join(', ')}"
    end
  end

  def destroy
    @game = Game.find(params[:id])
    if @game.destroy
      redirect_to :games, notice: 'Game destroyed.'
    else
      redirect_to :games, alert: "Please review following #{@game.errors.full_messages.join(', ')}"
    end
  end

  private

  def game_params
    params.require(:game).permit(:name, :description, :start_at, :end_at,
                                 participations_attributes: %i[player_id score])
  end
end
