class ApplicationController < ActionController::Base
  def index
  end

  def search
    if params[:q] and params[:q].length >= 3
      @games = Game.where("title ilike '#{params[:q]}%'")
                   .order(release_date: :desc, title: :asc).all
    end
  end
end
