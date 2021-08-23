class QuarterlyResult < ApplicationRecord
  belongs_to :student

  validates :date, presence: :true

  [:ge, :vocab_ge, :reading_comp_ge, :lnf, :snf, :nwf_cls, :nwf_wrc, :wrf, :orf_grade_lvl, :orf_cwpm, :orf_accuracy].each do |field|
    validates field, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  end
end
