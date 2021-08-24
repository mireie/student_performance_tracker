class AddTeacheridToStudent < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :teacher_id, :integer
  end
end
