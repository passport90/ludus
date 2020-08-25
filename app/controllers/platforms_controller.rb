class PlatformsController < ApplicationController
  def index
    @platforms = Platform.select(:id, :name).order(release_date: :desc).all
  end

  def show
    @platform = Platform.find(params[:id])
    items_per_page = 10
    @page = params.fetch(:page, 0).to_i
    @page_count = (
      @platform.games.where('score is not null').count.to_f / items_per_page
    ).ceil
    @games = @platform.games.includes(:badges)
                      .where('score is not null')
                      .order(score: :desc, release_date: :desc, title: :asc)
                      .offset(@page * items_per_page).limit(items_per_page)
                      .limit(items_per_page).all
  end

  def new
    @platform = Platform.new
  end

  def create
    @platform = Platform.new(platform_params)

    @platform.save
    redirect_to platforms_path
  end

  def edit
    @platform = Platform.find(params[:id])
  end

  def update
    @platform = Platform.find(params[:id])

    if @platform.update!(platform_params)
      redirect_to platform_path(@platform)
    else
      render 'edit'
    end
  end

  private

  def platform_params
    params.require(:platform).permit(:name, :release_date, :publisher_id)
  end
end
