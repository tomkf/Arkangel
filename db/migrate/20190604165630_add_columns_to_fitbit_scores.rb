class AddColumnsToFitbitScores < ActiveRecord::Migration[5.2]
  def change
    add_column :fitbit_scores, :sleep_score, :float
    add_column :fitbit_scores, :floors, :float
  end
end
