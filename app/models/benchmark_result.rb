# frozen_string_literal: true

class BenchmarkResult < ApplicationRecord
  include Season
  belongs_to :student

  validates :date, presence: :true

  [
    :ge,
    :vocab_ge,
    :reading_comp_ge,
    :lnf,
    :snf,
    :orf_grade_lvl,
    :orf_cwpm,
    :orf_accuracy,
    :orf_instructional_grade_lvl,
    :orf_instructional_cwpm,
    :orf_instructional_accuracy
  ].each do |field|
    validates field, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1000 }, allow_blank: true
  end

  validate :date_is_reasonable

  def date_is_reasonable
    max_date = Date.today + 1.year
    if date.present? && date > max_date
      errors.add(:date, "Date must be before one year from now: #{max_date}")
    end
  end

end
