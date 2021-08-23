class CreateDibelsResults < ActiveRecord::Migration[5.2]
  def change
    create_table :dibels_results do |t|
      t.date :date
      t.float :grade
      t.float :dibels
      t.float :accuracy
      t.integer :student_id 

      t.timestamps
    end
    add_foreign_key :dibels_results, :students
  end
end
