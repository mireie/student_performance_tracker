class AddFloatPrecision < ActiveRecord::Migration[5.2]
  def change
    change_column :benchmarks, :ge, :float, :precision=>4, :scale=>1
    change_column :benchmarks, :vocab_ge, :float, :precision=>4, :scale=>1
    change_column :benchmarks, :reading_comp_ge, :float, :precision=>4, :scale=>1
    change_column :benchmarks, :orf_accuracy, :float, :precision=>3, :scale=>3
  end
end
