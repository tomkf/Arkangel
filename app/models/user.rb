class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user_scores
  has_many :fitbit_scores
  validates :first_name, :last_name, presence: true

  # authenticates with fitbit and returns the client object
  def fitbit_client
    # On authorization, we stored the user's credentials in the database
    # now, whenever we like, we can call this method anywhere

    client = FitbitAPI::Client.new(
      client_id: ENV["FITBIT_ID"],
      client_secret: ENV["FITBIT_SECRET"],
      access_token: self.fitbit_access_token,
      refresh_token: self.fitbit_refresh_token,
      expires_at: self.fitbit_expires_at,
      user_id: self.fitbit_user_id
      )

    return client
  end
end
