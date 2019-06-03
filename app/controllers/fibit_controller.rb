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

end
