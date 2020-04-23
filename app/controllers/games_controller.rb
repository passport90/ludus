class GamesController < ApplicationController
  def index
    @week_start = week_start
    @next_week = @week_start + 1.week
    @prev_week = @week_start - 1.week
    query = Game.includes(:platform)
                .select(:id, :title, :platform_id, :release_date, :score)
    query = filter_by_week(query)
    @games = query.order(:release_date, :title, :platform_id).all
  end

  def show
    @game = Game.select(:id, :title, :platform_id, :release_date, :publisher_id,
                        :genre_id, :esrb_rating_id, :score)
                .find(params[:id])
    @score_color = if @game.score == nil
      'gray'
    elsif @game.score < 50
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
    redirect_to game_url(@game)
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

  def week_start
    year = params[:year]
    unless year
      year = Game.select(:release_date).order(release_date: :desc).first
                  .release_date.cwyear
    end
    week = params[:week]
    unless week
      week = Game.select(:release_date).order(release_date: :desc)
                  .where("extract(isoyear from release_date) = ?", year)
                  .first.release_date.cweek
    end

    Date.strptime(year.to_s + week.to_s.rjust(2, '0'), '%G%V')
  end

  def filter_by_week(query)
    query.where('release_date >= ?', @week_start)
         .where('release_date < ?', @week_start + 1.week)
  end
end