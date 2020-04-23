class GenresController < ApplicationController
  def index
    @genres = Genre.select(:id, :name).order(:path).all
  end

  def show
    @genre = Genre.find(params[:id])
    @games = Game.where(genre: @genre)
                 .order(release_date: :desc, title: :asc).all
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.path = to_path(@genre.name)

    @genre.save
    redirect_to genres_url
  end

private
  def genre_params
    params.require(:genre).permit(:name, :path)
  end

  def to_path(name)
    name.split(' » ').map { |token| token.downcase.gsub(/\W/, '_') }.join('.')
  end
end
