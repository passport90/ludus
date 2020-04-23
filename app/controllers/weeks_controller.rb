class WeeksController < ApplicationController
  def index
    @year = if params[:year]
      params[:year].to_i
    else
      Game.order(release_date: :desc).limit(1)
          .pluck("extract(isoyear from release_date)").first.to_i
    end
    @weeks = Game.order(week: :asc).distinct
                 .where("extract(year from release_date) = ?", @year)
                 .pluck("extract(week from release_date) as week").map(&:to_i)
  end
end
