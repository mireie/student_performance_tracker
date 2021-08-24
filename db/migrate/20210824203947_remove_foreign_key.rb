class RemoveForeignKey < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :students, :teachers
  end
end
