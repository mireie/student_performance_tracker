# frozen_string_literal: true

class Student < ApplicationRecord
  include Season
  belongs_to :teacher, counter_cache: true, optional: true
  has_many :benchmark_results, dependent: :destroy
  has_many :progresses, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true

  scope :is_active, -> { where ("active = true") }
  scope :not_active, -> { where ("active = false") }

  def self.search(query)
    Student.where("LOWER(last_name) LIKE LOWER(?)", "%#{query}%")
      .or(Student.where("LOWER(first_name) LIKE LOWER(?)", "%#{query}%"))
  end

  def last_benchmark_date
    benchmark_results.order(:date).last.date if benchmark_results.order(:date).present?
  end

  def last_progress_date
    progresses.order(:date).last.date if progresses.order(:date).present?
  end

  def avg_progress_dibels
    if self.progresses.size > 0 && self.progresses.sum(:dibels) > 0
      self.progresses.average(:dibels).to_f.round(2)
    else
      "No progress test results"
    end
  end

  def avg_progress_accuracy
    if self.progresses.size > 0 && self.progresses.sum(:accuracy) > 0
      average = self.progresses.average(:accuracy)
      "#{average.round(2)}%"
    else
      "No progress test results"
    end
  end

  def student_name
    self.first_name + " " + self.last_name
  end

  before_save(:capitalize_name)

  private

  def capitalize_name
    self.first_name = self.first_name.capitalize
    self.last_name = self.last_name.capitalize
  end
end
