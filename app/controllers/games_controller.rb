class GamesController < ApplicationController
  def index
    @week_start = Date.strptime(params[:week], '%G%V') if params[:week]
    if @week_start
      query = Game.includes(:platform)
                  .select(:id, :title, :platform_id, :release_date)
      query = filter_by_week(query)
      @games = query.order(:release_date, :title).all
    else
      @weeks = Game.order(:week).distinct
                   .pluck("to_char(release_date, 'IW IYYY') as week")
    end
  end

  def show
    @game = Game.select(:id, :title, :platform_id, :release_date, :publisher_id,
                        :genre_id, :esrb_rating_id, :score)
                .find(params[:id])
    @score_color = if @game.score < 50
      'red'
    elsif @game.score < 75
      'yellow'
    else
      'green'
    end
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

  def filter_by_week(query)
    return query unless @week_start

    query.where('release_date >= ?', @week_start)
         .where('release_date < ?', @week_start + 1.week)
  end
end
