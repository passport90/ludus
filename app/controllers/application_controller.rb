class ApplicationController < ActionController::Base
  def index
    @disable_nav = true
  end

  def search
    if params[:q] && (params[:q].length >= 3)
      @q = params[:q]
      @game_count = Game.where("title ilike '#{@q}%'").count
      items_per_page = 10
      @page = params.fetch(:page, 0).to_i
      @page_count = (@game_count.to_f / items_per_page).ceil
      @games = Game.where("title ilike '#{@q}%'")
                   .order(release_date: :desc, title: :asc)
                   .offset(@page * items_per_page).limit(items_per_page)
                   .all
    end
  end
end
