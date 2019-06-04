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

    redirect_to dashboard_path
  end

<<<<<<< HEAD

# def seeded_log
#   '2019-06-01'
# date_target = FitbitScore.last.logdate
# date_convert = date_target[8, 9].to_i


# end

=======
  def notification
    render json: { score: score }
  end

  private

  def score
    last_score = current_user.fitbit_scores.last
    if last_score.present? && last_score.notified_user == false && last_score.created_at > 15.minutes.ago
      last_score.notified_user = true
      last_score.save
      last_score.health_score.round.to_s
    end
  end
>>>>>>> 48cd8d747de1066af1c3e7c37b8b466d120e8714

end
