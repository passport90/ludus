class BadgesController < ApplicationController
  def index
    @years = Badge.order(year: :desc).distinct
                  .pluck("extract(year from award_date) as year")
                  .map(&:to_i)
    @year = params.fetch(:year, @years.first).to_i
    year_start = Date.new(@year, 1, 1)
    @badges = Badge.select(:id, :name, :symbol)
                   .where('award_date >= ?', year_start)
                   .where('award_date < ?', year_start + 1.year)
                   .order(award_date: :desc, name: :asc).all
  end

  def show
    @badge = Badge.find(params[:id])
    @games = @badge.games.includes(:platform).
                    order(release_date: :desc, title: :asc).all
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
  def badge_params
    params.require(:badge).permit(:name, :symbol, :award_date, :is_complete)
  end
end
