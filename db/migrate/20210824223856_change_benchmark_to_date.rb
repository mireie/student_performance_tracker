class ChangeBenchmarkToDate < ActiveRecord::Migration[5.2]
  def change
    change_column :benchmark_results, :date, 'date USING CAST(date AS date)'
  end
end
