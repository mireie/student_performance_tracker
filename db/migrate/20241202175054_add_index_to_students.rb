class AddIndexToStudents < ActiveRecord::Migration[8.0]
  def change
    add_index :students, :teacher_id
    add_index :benchmark_results, :student_id
    add_index :progresses, :student_id
  end
end
