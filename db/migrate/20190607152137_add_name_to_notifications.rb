class AddNameToNotifications < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :name, :string
  end
end
