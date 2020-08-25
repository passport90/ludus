class BadgeYearsController < ApplicationController
  def index
    @years = Badge.order(year: :desc).distinct
                  .pluck('extract(year from award_date) as year')
                  .map(&:to_i)
  end
end
