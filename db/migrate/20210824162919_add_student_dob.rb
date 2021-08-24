class AddStudentDob < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :dob, :date
  end
end
