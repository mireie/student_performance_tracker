# frozen_string_literal: true

class Teacher < ApplicationRecord
  has_many :students

  validates :first_name, presence: true
  validates :last_name, presence: true

  scope :is_active, -> { where ("active = true") }
  scope :not_active, -> { where ("active = false") }

  before_save(:capitalize_name)

  def full_name
    self.first_name + " " + self.last_name
  end

  private

  def capitalize_name
    self.first_name = self.first_name.capitalize
    self.last_name = self.last_name.capitalize
  end
end
