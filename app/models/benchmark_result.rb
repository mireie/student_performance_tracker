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

end
