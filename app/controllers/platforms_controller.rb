class PlatformsController < ApplicationController
  def index
    @platforms = Platform.select(:id, :name).order(:release_date).all
  end

  def show
    @platform = Platform.select(:name, :release_date, :publisher_id)
                        .find(params[:id])
  end

  def new
    @platform = Platform.new
    @publishers = Publisher.select(:id, :name).order(:name).all
    @publisher_options = @publishers.map do |publisher|
      [publisher.name, publisher.id]
    end
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
