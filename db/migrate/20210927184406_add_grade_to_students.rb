class AddGradeToStudents < ActiveRecord::Migration[5.2]
  def change
    remove_column :students, :dob
    add_column :students, :grade, :integer
  end
end
