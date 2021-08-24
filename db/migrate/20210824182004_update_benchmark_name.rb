class UpdateBenchmarkName < ActiveRecord::Migration[5.2]
  def change
    rename_table :benchmarks, :benchmark_results
  end
end
