class AddTestsToBenchmarks < ActiveRecord::Migration[5.2]
  def change
    add_column :benchmark_results, :sight_word_ge, :float
    add_column :benchmark_results, :phonemic_decoding_ge, :float
    add_column :benchmark_results, :elison_ge, :float
    add_column :benchmark_results, :blending_ge, :float
    add_column :benchmark_results, :isolation_ge, :float
  end
end
