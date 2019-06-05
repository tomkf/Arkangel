DAY_IN_SECONDS = 3600 * 24

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user_scores
  has_many :fitbit_scores
  has_many :user_params
  validates :first_name, :last_name, :age, :smoker, presence: true


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

  def fetch_historical_data
     binding.pry

     # create the empty scores for the past 100 days

    7.times do |i|
      FitbitScore.create!({
        logdate: Time.now - DAY_IN_SECONDS * i,
        user: self
      })
    end

    client = fitbit_client
    sleep_info_raw = client.sleep_time_series({ start_date: Time.now - DAY_IN_SECONDS * 7 })

    sleep_info = sleep_info_raw.map do |day|
      {
       dateOfSleep: day["dateOfSleep"],
       summary: day["levels"]["summary"],
       minutesAsleep: day["minutesAsleep"],
       minutesAwake: day["minutesAwake"],
       timeInBed: day["timeInBed"]
      }
    end

    sleep_info.each do |day|
      score_day = FitbitScore.find_by(logdate: day[:dateOfSleep])

      score_day.overall_sleep = day[:timeInBed]
      score_day.awaken_sleep = day[:minutesAwake]
      score_day.deep_sleep = day[:summary]["deep"]["minutes"]
      score_day.light_sleep = day[:summary]["light"]["minutes"]
      score_day.rem_sleep = day[:summary]["rem"]["minutes"]

      score_day.save!
    end


    fitbit_client.activity_logs_list
    #.bla, bla call all the methods we need and store them in the table fitbit_score
  end

  def fecth_new_data
    fibit_client
    #.bla, bla call all the methods we need and store them in the table fitbit_score
  end

end
