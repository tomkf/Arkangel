class AddFieldsToUser < ActiveRecord::Migration[5.2]
  def change
        add_column :users, :first_name, :string
        add_column :users, :last_name, :string
        add_column :users, :age, :integer
        add_column :users, :smoker, :string
  end
end
