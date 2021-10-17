class BadgesController < ApplicationController
  def index
    @year = params.fetch(:year, first_year).to_i
    year_start = Date.new(@year, 1, 1)
    @badges = Badge.select(:id, :name, :symbol)
                   .where('award_date >= ?', year_start)
                   .where('award_date < ?', year_start + 1.year)
                   .order(award_date: :desc, name: :asc).all
  end

  def show
    @badge = Badge.find(params[:id])
    @game_count = @badge.games.count
    items_per_page = 10
    @page = params.fetch(:page, 0).to_i
    @page_count = (@game_count.to_f / items_per_page).ceil
    @games = @badge.games.includes(:platform)
                   .order(release_date: :desc, title: :asc)
                   .offset(@page * items_per_page).limit(items_per_page)
                   .all
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)

    @badge.save
    redirect_to badges_path
  end

  def edit
    @badge = Badge.find(params[:id])
  end

  def update
    @badge = Badge.find(params[:id])

    @badge.update(badge_params)
    redirect_to badge_path(@badge)
  end

  private

  def first_year
    Badge.order(year: :desc).distinct
         .pluck(Arel.sql('extract(year from award_date) as year')).first.to_i
  end

  def badge_params
    params.require(:badge).permit(:name, :symbol, :award_date, :is_complete)
  end
end
