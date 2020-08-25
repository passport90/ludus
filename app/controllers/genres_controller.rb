class GenresController < ApplicationController
  def index
    items_per_page = 60
    @page = params.fetch(:page, 0).to_i
    @page_count = (Genre.count.to_f / items_per_page).ceil
    @genres = Genre.select(:id, :name).order(:path)
                   .offset(@page * items_per_page).limit(items_per_page).all
  end

  def show
    @genre = Genre.find(params[:id])
    @game_count = @genre.games.count
    items_per_page = 10
    @page = params.fetch(:page, 0).to_i
    @page_count = (@game_count.to_f / items_per_page).ceil
    @games = @genre.games.includes(:platform, :badges)
                   .order(release_date: :desc, title: :asc)
                   .offset(@page * items_per_page).limit(items_per_page)
                   .all
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.path = to_path(@genre.name)

    @genre.save
    redirect_to genres_path
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.assign_attributes(genre_params)
    @genre.path = to_path(@genre.name)

    if @genre.save!
      redirect_to genre_path(@genre)
    else
      render 'edit'
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name, :path)
  end

  def to_path(name)
    name.split(' » ').map { |token| token.downcase.gsub(/\W/, '_') }.join('.')
  end
end
