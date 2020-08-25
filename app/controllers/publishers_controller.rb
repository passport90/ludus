class PublishersController < ApplicationController
  def index
    items_per_page = 60
    @page = params.fetch(:page, 0).to_i
    @page_count = (Publisher.count.to_f / items_per_page).ceil
    @publishers = Publisher.select(:id, :name).order(:name)
                           .offset(@page * items_per_page)
                           .limit(items_per_page)
                           .all
  end

  def show
    @publisher = Publisher.find(params[:id])
    items_per_page = 10
    @page = params.fetch(:page, 0).to_i
    @page_count = (@publisher.games.count.to_f / items_per_page).ceil
    @games = @publisher.games.includes(:platform, :badges)
                       .order(release_date: :desc, title: :asc)
                       .offset(@page * items_per_page).limit(items_per_page)
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

  def edit
    @publisher = Publisher.find(params[:id])
  end

  def update
    @publisher = Publisher.find(params[:id])

    if @publisher.update!(publisher_params)
      redirect_to publisher_path(@publisher)
    else
      render 'edit'
    end
  end

  private

  def publisher_params
    params.require(:publisher).permit(:name)
  end
end
