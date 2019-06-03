class AddFitbitToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :fitbit_access_token, :string
    add_column :users, :fitbit_refresh_token, :string
    add_column :users, :fitbit_expires_at, :integer
    add_column :users, :fitbit_user_id, :string

  end
end
