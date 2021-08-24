class AddStudentsForeignKey < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :students, :teachers
  end
end
