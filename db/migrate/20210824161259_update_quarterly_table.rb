class UpdateQuarterlyTable < ActiveRecord::Migration[5.2]
  def change
    rename_table :quarterly_results, :benchmarks
  end
end
