class Student < ApplicationRecord
  belongs_to :teacher
  has_many :benchmark_results, dependent: :destroy
  has_many :progresses, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true

  def last_benchmark_date
    date = self.benchmark_results.order(:date)
    if date.size > 0
      date.last.date
    else
      "N/A"
    end
  end

  def last_progress_date
    date = self.progresses.order(:date)
    if date.size > 0
      date.last.date
    else
      "N/A"
    end
  end

  def avg_progress_dibels
    if self.progresses.size > 0
    self.progresses.average(:dibels).to_f.round(2)
    else
      "No Progress test results"
    end
  end

  def avg_progress_accuracy
    if self.progresses.size > 0
    self.progresses.average(:accuracy).to_f*100
    else
      "No Progress test results"
    end
  end


  before_save(:capitalize_name)

  private

  def capitalize_name
    self.first_name = self.first_name.capitalize
    self.last_name = self.last_name.capitalize
  end
end
