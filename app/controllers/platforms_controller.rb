class PlatformsController < ApplicationController
  def index
    @platforms = Platform.select(:id, :name).order(:release_date).all
  end

  def show
    @platform = Platform.select(:id, :name, :release_date, :publisher_id)
                        .find(params[:id])
    @games = @platform.games.where('score is not null')
                      .order(score: :desc, release_date: :desc, title: :asc)
                      .limit(10).all
  end

  def new
    @platform = Platform.new
  end

  def create
    @platform = Platform.new(platform_params)

    @platform.save
    redirect_to platforms_path
  end

private
  def platform_params
    params.require(:platform).permit(:name, :release_date, :publisher_id)
  end
end
