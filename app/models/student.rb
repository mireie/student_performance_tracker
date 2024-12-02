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
    cached_last_benchmark_date || update_cached_benchmark_date
  end

  def last_progress_date
    cached_last_progress_date || update_cached_progress_date
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

  after_save :update_cached_dates

  def update_cached_benchmark_date
    latest_date = benchmark_results.select(:date).order(date: :desc).limit(1).pluck(:date).first
    update_column(:cached_last_benchmark_date, latest_date)
    latest_date
  end

  def update_cached_progress_date
    latest_date = progresses.select(:date).order(date: :desc).limit(1).pluck(:date).first
    update_column(:cached_last_progress_date, latest_date)
    latest_date
  end

  private

  def capitalize_name
    self.first_name = self.first_name.capitalize
    self.last_name = self.last_name.capitalize
  end

  def update_cached_dates
    update_cached_benchmark_date
    update_cached_progress_date
  end

  def touch_last_benchmark_date(_record)
    update_cached_benchmark_date
  end

  def touch_last_progress_date(_record)
    update_cached_progress_date
  end
end
