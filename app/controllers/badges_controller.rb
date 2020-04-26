class BadgesController < ApplicationController
  def index
    @badges = Badge.select(:id, :name, :symbol)
                   .order(award_date: :desc, name: :asc).all
  end

  def show
    @badge = Badge.find(params[:id])
    @games = @badge.games.order(release_date: :desc, title: :asc).all
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
    params.require(:badge).permit(:name, :symbol, :award_date)
  end
end
