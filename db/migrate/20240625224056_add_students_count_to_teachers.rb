class AddStudentsCountToTeachers < ActiveRecord::Migration[6.1]
  def change
    add_column :teachers, :students_count, :integer, default: 0, null: false

    Teacher.find_each do |teacher|
      Teacher.reset_counters(teacher.id, :students)
    end
  end

  private

  def reset_counters(teacher_id, association)
    teacher = Teacher.find(teacher_id)
    teacher.update_column("#{association}_count", teacher.send(association).length)
  end
end
