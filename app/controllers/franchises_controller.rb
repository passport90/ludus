class FranchisesController < ApplicationController
  def index
    items_per_page = 60
    @page = params.fetch(:page, 0).to_i
    @page_count = (Franchise.count.to_f / items_per_page).ceil
    @franchises = Franchise.select(:id, :name).order(:name)
                           .offset(@page * items_per_page).limit(items_per_page)
                           .all
  end

  def show
    @franchise = Franchise.find(params[:id])
    @game_count = @franchise.games.count
    items_per_page = 10
    @page = params.fetch(:page, 0).to_i
    @page_count = (@game_count.to_f / items_per_page).ceil
    @games = @franchise.games.includes(:platform, :badges)
                       .order(release_date: :desc, title: :asc)
                       .offset(@page * items_per_page).limit(items_per_page)
                       .all
  end

  def new
    @franchise = Franchise.new
  end

  def create
    @franchise = Franchise.new(franchise_params)

    @franchise.save
    redirect_to franchises_path
  end

  def edit
    @franchise = Franchise.find(params[:id])
  end

  def update
    @franchise = Franchise.find(params[:id])

    if @franchise.update!(franchise_params)
      redirect_to franchise_path(@franchise)
    else
      render 'edit'
    end
  end

  private

  def franchise_params
    params.require(:franchise).permit(:name)
  end
end
