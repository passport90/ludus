class GamesController < ApplicationController
  def index
    @games = Game.includes(:platform).select(:id, :title, :platform_id)
                 .order(:release_date, :title).all
  end

  def show
    @game = Game.select(:id, :title, :platform_id, :release_date, :publisher_id,
                        :genre_id, :esrb_rating_id, :score)
                .find(params[:id])
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)

    @game.save
    redirect_to games_url
  end

private
  def game_params
    params.require(:game)
          .permit(:title, :platform_id, :release_date, :publisher_id, :genre_id,
                  :esrb_rating_id, :score)
  end

  def to_options(models)
    @models.map { |model| [model.name, model.id] }
  end
end
