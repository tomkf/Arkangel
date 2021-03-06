class FibitController < ApplicationController
  def auth
    client = FitbitAPI::Client.new(
      client_id: ENV["FITBIT_ID"],
      client_secret: ENV["FITBIT_SECRET"],
      redirect_uri: ENV["FITBIT_REDIRECT_URL"]
    )
    client.get_token(params[:code])

    current_user.fitbit_access_token = client.token.token
    current_user.fitbit_refresh_token = client.token.refresh_token
    current_user.fitbit_expires_at = client.token.expires_at
    current_user.fitbit_user_id = client.token.params["user_id"]
    current_user.save

    # fetches all the historical data
    current_user.fetch_historical_data(14)
    # show a "calculating page"
    # TO DO

    # redirect to dashboard
    redirect_to dashboard_path
  end

  def notification
    render json: { score: score }
  end

  private

  def score
    last_score = current_user.fitbit_scores.order(:logdate).last
    if last_score.present? && last_score.notified_user == false
      last_score.notified_user = true
      last_score.save
      "New score: #{last_score.health_score.round(1)}"
    elsif current_user.notifications.last.present? && current_user.notifications.last.notified == false
      current_user.notifications.last.update(notified: true)
      current_user.notifications.last.message.to_s
    end
  end
end
