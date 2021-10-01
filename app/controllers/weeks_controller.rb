class WeeksController < ApplicationController
  def index
    @year = if params[:year]
      params[:year].to_i
    else
      Game.order(release_date: :desc).limit(1)
          .pluck("extract(isoyear from release_date)").first.to_i
    end
    weeks_nums = Game.order(week: :asc).distinct
                .where("extract(year from release_date) = ?", @year)
                .pluck(Arel.sql("extract(week from release_date) as week")).map(&:to_i)
    @weeks = weeks_nums.map do |week_num|
      {
        week_num: week_num,
        week_start: (
          Date.strptime(@year.to_s + week_num.to_s.rjust(2, '0'), '%G%V')
        )
      }
    end
  end
end
