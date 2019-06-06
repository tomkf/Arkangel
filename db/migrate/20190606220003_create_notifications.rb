class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.string :message
      t.boolean :notified

      t.timestamps
    end
  end
end
