class Update < ActiveRecord::Migration[5.2]
  def change
    rename_table :dibels_results, :progresses
  end
end
