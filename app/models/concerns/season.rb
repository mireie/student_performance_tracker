# frozen_string_literal: true

module Season
  extend ActiveSupport::Concern

  def get_season(full_date)
    if full_date.respond_to?(:strftime)
      month = full_date.month
      if (8..11).include?(month)
        season = "Fall"
      elsif [12, 1, 2, 3].include?(month)
        season = "Winter"
      elsif month.between?(4, 6)
        season = "Spring"
      elsif month === 7
        season = "Summer"
      else
        season = "Month Value: #{month}"
      end
      return "#{season} #{full_date.year}"
    else
      return "N/A"
    end
  end
end
