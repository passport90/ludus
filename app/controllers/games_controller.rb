class GamesController < ApplicationController
  def index
    @week_start = week_start
    @next_week = @week_start + 1.week
    @prev_week = @week_start - 1.week
    query = Game.includes(:platform, :badges)
                .select(:id, :title, :platform_id, :release_date, :score, 
                        :is_date_confirmed)
    query = filter_by_week(query)
    @games = query.order(:release_date, :title, :platform_id).all
  end

  def show
    @game = Game.find(params[:id])
    @score_color = if @game.score == nil
      'gray'
    elsif @game.score < 50
      'red'
    elsif @game.score < 75
      'yellow'
    else
      'green'
    end

    @badges = @game.badges.select(:id, :name, :symbol)
                          .order(award_date: :desc, name: :asc).all
    @image_folder = @game.id / 1000
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)

    @game.save
    redirect_to game_path(@game)
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])


    if @game.update!(game_params)
      redirect_to game_path(@game)
    else
      render 'edit'
    end
  end

private
  def game_params
    params.require(:game)
          .permit(:title, :platform_id, :release_date, :publisher_id, :genre_id,
                  :esrb_rating_id, :franchise_id, :score, :video_link,
                  :is_date_confirmed)
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
