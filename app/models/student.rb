class Student < ApplicationRecord
  has_many :quarterly_results, dependent: :destroy
  has_many :dibels_results, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true

  before_save(:capitalize_name)

  private
    def capitalize_name
      self.first_name = self.first_name.capitalize
      self.last_name = self.last_name.capitalize
    end
end
