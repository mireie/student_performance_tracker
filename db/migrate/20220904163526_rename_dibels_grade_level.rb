class RenameDibelsGradeLevel < ActiveRecord::Migration[6.1]
  def change
    rename_column :benchmark_results, :orf_grade_lvl, :orf_instructional_grade_lvl
    rename_column :benchmark_results, :orf_cwpm, :orf_instructional_cwpm
    rename_column :benchmark_results, :orf_accuracy, :orf_instructional_accuracy
  end
end
