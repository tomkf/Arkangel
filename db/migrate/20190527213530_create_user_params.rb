class CreateUserParams < ActiveRecord::Migration[5.2]
  def change
    create_table :user_params do |t|
      t.float :bmi
      t.integer :weight
      t.integer :height
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
