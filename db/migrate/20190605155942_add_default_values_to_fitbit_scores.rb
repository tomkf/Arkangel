class AddDefaultValuesToFitbitScores < ActiveRecord::Migration[5.2]
  def change
    change_column :fitbit_scores, :floors, :float, :default => 0.0
    change_column :fitbit_scores, :bmi, :float, :default => 0.0
    change_column :fitbit_scores, :exercise_km, :float, :default => 0.0
    change_column :fitbit_scores, :water, :float, :default => 0.0
    change_column :fitbit_scores, :carbs, :float, :default => 0.0
    change_column :fitbit_scores, :fat, :float, :default => 0.0
    change_column :fitbit_scores, :fiber, :float, :default => 0.0
    change_column :fitbit_scores, :protein, :float, :default => 0.0
    change_column :fitbit_scores, :sodium, :float, :default => 0.0
    change_column :fitbit_scores, :sugar, :float, :default => 0.0
    change_column :fitbit_scores, :cholesterol, :float, :default => 0.0
    change_column :fitbit_scores, :diet_cal, :float, :default => 0.0
    change_column :fitbit_scores, :alcohol_ml, :float, :default => 0.0
    change_column :fitbit_scores, :overall_sleep, :integer, :default => 0.0
    change_column :fitbit_scores, :awaken_sleep, :integer, :default => 0.0
    change_column :fitbit_scores, :rem_sleep, :integer, :default => 0.0
    change_column :fitbit_scores, :light_sleep, :integer, :default => 0.0
    change_column :fitbit_scores, :deep_sleep, :integer, :default => 0.0
    change_column :fitbit_scores, :heart_rate, :integer, :default => 0.0
    change_column :fitbit_scores, :steps, :integer, :default => 0.0
    change_column :fitbit_scores, :active_minutes, :integer, :default => 0.0
    change_column :fitbit_scores, :exercise_time, :integer, :default => 0.0
    change_column :fitbit_scores, :exercise_cal, :integer, :default => 0.0
  end
end


