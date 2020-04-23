class PlatformsController < ApplicationController
  def index
    @platforms = Platform.select(:id, :name).order(:release_date).all
  end

  def show
    @platform = Platform.select(:id, :name, :release_date, :publisher_id)
                        .find(params[:id])
  end

  def new
    @platform = Platform.new
  end

  def create
    @platform = Platform.new(platform_params)

    @platform.save
    redirect_to platforms_url
  end

private
  def platform_params
    params.require(:platform).permit(:name, :release_date, :publisher_id)
  end
end
