class FranchisesController < ApplicationController
  def index
    @franchises = Franchise.select(:id, :name).order(:name).all
  end

  def show
    @franchise = Franchise.find(params[:id])
    @page = params.fetch(:page, 0).to_i
    @page_count = (@franchise.games.count.to_f / 10).ceil
    @games = @franchise.games.includes(:platform)
                       .order(release_date: :desc, title: :asc)
                       .offset(@page * 10).limit(10)
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

private
  def franchise_params
    params.require(:franchise).permit(:name)
  end

end
