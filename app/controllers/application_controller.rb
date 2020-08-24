class ApplicationController < ActionController::Base
  def index
    @disable_nav = true
  end

  def search
    if params[:q] && (params[:q].length >= 3)
      @games = Game.where("title ilike '#{params[:q]}%'")
                   .order(release_date: :desc, title: :asc).all
    end
  end
end
