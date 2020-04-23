class YearsController < ApplicationController
  def index
    @years = Game.order(year: :desc).distinct
                 .pluck("extract(isoyear from release_date) as year")
                 .map(&:to_i)
  end
end
