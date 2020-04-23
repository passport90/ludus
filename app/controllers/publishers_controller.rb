class PublishersController < ApplicationController
  def index
    @publishers = Publisher.select(:id, :name).order(:name).all
  end

  def show
    @publisher = Publisher.find(params[:id])
    @games = @publisher.games.order(release_date: :desc, title: :asc).all
  end

  def new
    @publisher = Publisher.new
  end

  def create
    @publisher = Publisher.new(publisher_params)

    @publisher.save
    redirect_to publishers_path
  end

private
  def publisher_params
    params.require(:publisher).permit(:name)
  end
end
