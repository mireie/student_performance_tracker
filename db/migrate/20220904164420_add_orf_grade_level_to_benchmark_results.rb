class AddOrfGradeLevelToBenchmarkResults < ActiveRecord::Migration[6.1]
  def change
    add_column :benchmark_results, :orf_grade_lvl, :integer
    add_column :benchmark_results, :orf_cwpm, :integer
    add_column :benchmark_results, :orf_accuracy, :decimal, precision: 8, scale: 3
  end
end
