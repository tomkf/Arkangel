class CreateFitbitScores < ActiveRecord::Migration[5.2]
  def change
    create_table :fitbit_scores do |t|
      t.float :stress_score
      t.float :exercise_score
      t.float :diet_score
      t.float :health_score
      t.float :bmi
      t.integer :overall_sleep
      t.integer :awaken_sleep
      t.integer :rem_sleep
      t.integer :light_sleep
      t.integer :deep_sleep
      t.integer :heart_rate
      t.integer :steps
      t.integer :active_minutes
      t.string :exercise_type
      t.integer :exercise_time
      t.float :exercise_km
      t.integer :exercise_cal
      t.float :water
      t.float :carbs
      t.float :fat
      t.float :fiber
      t.float :protein
      t.float :sodium
      t.float :sugar
      t.float :cholesterol
      t.float :diet_cal
      t.float :alcohol_ml
      t.date :logdate
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
