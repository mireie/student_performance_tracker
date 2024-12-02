class AddCachedDatesToStudents < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :cached_last_benchmark_date, :date
    add_column :students, :cached_last_progress_date, :date

    # Add indexes for better query performance
    add_index :students, :cached_last_benchmark_date
    add_index :students, :cached_last_progress_date
  end
end