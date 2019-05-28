class CreateUserScores < ActiveRecord::Migration[5.2]
  def change
    create_table :user_scores do |t|
      t.float :health_score
      t.float :bmi
      t.float :physical_activity
      t.float :fruits_vegetables
      t.float :whole_grains
      t.float :red_meat
      t.float :processed_meat
      t.float :fats
      t.float :soda
      t.float :alcohol
      t.date :logdate
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
