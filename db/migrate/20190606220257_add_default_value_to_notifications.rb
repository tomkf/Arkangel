class AddDefaultValueToNotifications < ActiveRecord::Migration[5.2]
  def change
    change_column :notifications, :notified, :boolean, :default => false
  end
end
