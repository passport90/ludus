class BadgesGamesController < ApplicationController
  def new
    game_id = params.require(:game).permit(:id)[:id]
    @game = Game.select(:id, :title, :platform_id).find(game_id)
    @badges = Badge.select(:id, :name, :award_date).order(:award_date, :name)
                   .all
  end

  def create
    @badge = Badge.select(:id).find(badge_game_params[:badge_id])
    @game = Game.select(:id).find(badge_game_params[:game_id])
    @badge.games << @game

    redirect_to game_path(@game)
  end

private
  def badge_game_params
    params.require(:badge_game).permit(:game_id, :badge_id)
  end
end
