# frozen_string_literal: true

class Progress < ApplicationRecord
  belongs_to :student

  validates :date, presence: :true
  validate :date_is_reasonable

  [:grade, :dibels, :accuracy].each do |field|
    validates field, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1000 }, allow_nil: true
  end

  def date_is_reasonable
    max_date = Date.today + 1.year
    if date.present? && date > max_date
      errors.add(:date, "Date must be before one year from now: #{max_date}")
    end
  end
end
