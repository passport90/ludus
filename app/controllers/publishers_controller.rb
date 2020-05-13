class PublishersController < ApplicationController
  def index
    @publishers = Publisher.select(:id, :name).order(:name).all
  end

  def show
    @publisher = Publisher.find(params[:id])
    @page = params.fetch(:page, 0).to_i
    @page_count = (@publisher.games.count.to_f / 10).ceil
    @games = @publisher.games.includes(:platform)
                       .order(release_date: :desc, title: :asc)
                       .offset(@page * 10).limit(10)
                       .all
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
