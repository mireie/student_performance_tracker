class Progress < ApplicationRecord
  belongs_to :student

  # validates_uniqueness_of :date, :message => "Student already has an established DIBELS result for this date. Please update it instead."

  validates :date, presence: :true

  [:grade, :dibels, :accuracy].each do |field|
    validates field, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  end
end
