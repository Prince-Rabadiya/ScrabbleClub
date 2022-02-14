class PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def show
    @player = Player.find(params[:id])
    @wins = 0
    @losses = 0
    @player&.played_games&.each do |game|
      game.winner&.id&.equal?(@player.id) ? @wins += 1 : @losses += 1
    end
    @avg_score = @player.participations.count > 1 ? @player.participations.pluck(:score).sum.to_f / @player.participations.count : nil
    @highest_score = @player.participations&.order(:score)&.last&.score
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      redirect_to @player, notice: 'Player created.'
    else
      render :new, alert: "Please review following #{@player.errors.full_messages.join(', ')}"
    end
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])
    if @player.update(player_params)
      redirect_to @player, notice: 'Player updated.'
    else
      render :edit, alert: "Please review following #{@player.errors.full_messages.join(', ')}"
    end
  end

  def destroy
    @player = Player.find(params[:id])
    if @player.destroy
      redirect_to :players, notice: 'Player destroyed.'
    else
      redirect_to :players, alert: "Please review following #{@player.errors.full_messages.join(', ')}"
    end
  end

  private

  def player_params
    params.require(:player).permit(:name, :age, :joining_date, :contact_number,
                                   :email)
  end
end
