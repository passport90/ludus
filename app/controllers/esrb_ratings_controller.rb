class EsrbRatingsController < ApplicationController
  def index
    @esrb_ratings = EsrbRating.select(:id, :name, :symbol).order(:name).all
  end

  def new
    @esrb_rating = EsrbRating.new
  end

  def create
    @esrb_rating = EsrbRating.new(rating_params)

    @esrb_rating.save
    redirect_to esrb_ratings_path
  end

  private

  def rating_params
    params.require(:esrb_rating).permit(:name, :symbol)
  end
end
