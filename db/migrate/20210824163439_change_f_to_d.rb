class ChangeFToD < ActiveRecord::Migration[5.2]
  def change
    change_column :benchmarks, :ge, :decimal, :precision=>6, :scale=>2
    change_column :benchmarks, :vocab_ge, :decimal, :precision=>6, :scale=>2
    change_column :benchmarks, :reading_comp_ge, :decimal, :precision=>6, :scale=>2
    change_column :benchmarks, :orf_accuracy, :decimal, :precision=>8, :scale=>3
  end
end
