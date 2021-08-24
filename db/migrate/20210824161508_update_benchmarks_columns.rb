class UpdateBenchmarksColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :benchmarks, :nwf_cls
    remove_column :benchmarks, :nwf_wrc
    remove_column :benchmarks, :wrf
    change_column :benchmarks, :ge, :float, {:precision=>4, :scale=>1}
    change_column :benchmarks, :vocab_ge, :float, {:precision=>4, :scale=>1}
    change_column :benchmarks, :reading_comp_ge, :float, {:precision=>4, :scale=>1}
    change_column :benchmarks, :lnf, :integer
    change_column :benchmarks, :snf, :integer
    change_column :benchmarks, :orf_grade_lvl, :integer
    change_column :benchmarks, :orf_cwpm, :integer
    change_column :benchmarks, :orf_accuracy, :float, {:precision=>3, :scale=>3}
  end
end



