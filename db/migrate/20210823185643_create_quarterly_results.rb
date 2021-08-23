class CreateQuarterlyResults < ActiveRecord::Migration[5.2]
  def change
    create_table :quarterly_results do |t|
      t.string :date
      t.float :ge
      t.float :vocab_ge
      t.float :reading_comp_ge
      t.float :lnf
      t.float :snf
      t.float :nwf_cls
      t.float :nwf_wrc
      t.float :wrf
      t.float :orf_grade_lvl
      t.float :orf_cwpm
      t.float :orf_accuracy
      t.integer :student_id

      t.timestamps
    end
    add_foreign_key :quarterly_results, :students
  end
end
