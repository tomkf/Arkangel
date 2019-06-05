class FetchFitbitJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    User.find(user_id).fetch_historical_data
  end
end
