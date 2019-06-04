class AddNotifyStatusToFitbitScores < ActiveRecord::Migration[5.2]
  def change
    add_column :fitbit_scores, :notified_user, :boolean, default: false
  end
end
