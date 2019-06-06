DAY_IN_SECONDS = 3600 * 24

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user_scores
  has_many :fitbit_scores
  has_many :user_params
  validates :first_name, :last_name, :dob, :smoker, presence: true

  before_create :assign_age
  before_update :assign_age


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


  def fetch_historical_data(days)
     # create the empty scores for the past 7 days

    days.times do |i|
      FitbitScore.create!({
        logdate: Time.now - DAY_IN_SECONDS * i,
        user: self
      })
    end

    # make an api call
    client = fitbit_client

    # make all the different api calls (returns an array)
    sleep_info_raw = client.sleep_time_series({ start_date: Time.now - DAY_IN_SECONDS * days })
    bmi_info = client.body_time_series('bmi',{start_date: Time.now - DAY_IN_SECONDS * days })
    heart_rate_info = client.heart_rate_time_series({start_date: Time.now - DAY_IN_SECONDS * days })

    # exercise calls
    steps_info = client.activity_time_series('steps', {start_date: Time.now - DAY_IN_SECONDS * days })
    active_minutes_info = client.activity_time_series('minutesFairlyActive', {start_date: Time.now - DAY_IN_SECONDS * days })
    exercise_km_info = client.activity_time_series('distance', {start_date: Time.now - DAY_IN_SECONDS * days })
    exercise_time_info = client.activity_time_series('minutesVeryActive', {start_date: Time.now - DAY_IN_SECONDS * days })
    exercise_cal_info = client.activity_time_series('calories', {start_date: Time.now - DAY_IN_SECONDS * days })

    exercise_type_info = client.activity_logs_list({start_date: Time.now - DAY_IN_SECONDS * days })['activities']

    # diet call
    # diet_cal_info = client.food_time_series('caloriesIn', {start_date:Time.now - DAY_IN_SECONDS * days})
    # water_info = client.food_time_series('water', {start_date:Time.now - DAY_IN_SECONDS * days})


    # organize the sleep data
    sleep_info = sleep_info_raw.map do |day|
      {
       dateOfSleep: day["dateOfSleep"],
       summary: day["levels"]["summary"],
       minutesAsleep: day["minutesAsleep"],
       minutesAwake: day["minutesAwake"],
       timeInBed: day["timeInBed"]
      }
    end

    # stores the sleep data
    sleep_info.each do |day|
      sleep_object = FitbitScore.find_by(logdate: day[:dateOfSleep])

      next if sleep_object.nil?

      sleep_object.overall_sleep = day[:timeInBed].nil? ?  0 :  day[:timeInBed]
      sleep_object.awaken_sleep  = day[:minutesAwake].nil? ?  0 :  day[:minutesAwake]

      if day[:summary]["deep"].nil? || day[:summary]["deep"]["minutes"].nil?
        sleep_object.deep_sleep  = 0
      else
        sleep_object.deep_sleep  = day[:summary]["deep"]["minutes"]
      end
      sleep_object.light_sleep = day[:summary]["light"].nil? || day[:summary]["light"]["minutes"].nil? ?  0 :  day[:summary]["light"]["minutes"]
      sleep_object.rem_sleep = day[:summary]["rem"].nil? || day[:summary]["rem"]["minutes"].nil? ?  0 :  day[:summary]["rem"]["minutes"]

      sleep_object.save!
    end

    # stores the bmi data
    bmi_info.each do |day|
      bmi_object = FitbitScore.find_by(logdate: day["dateTime"])
      next if bmi_object.nil?
      bmi_object.bmi = day["value"].nil? ? 0 : day["value"]
      bmi_object.save!
    end

    # stores the heart_rate data
    heart_rate_info.each do |day|
      heart_rate_object = FitbitScore.find_by(logdate: day["dateTime"])
      next if heart_rate_object.nil?
      heart_rate_object.heart_rate = day["value"]["restingHeartRate"].nil? ?  0 : day["value"]["restingHeartRate"]
      heart_rate_object.save!
    end

    # stores the steps data
    steps_info.each do |day|
      steps_object = FitbitScore.find_by(logdate: day["dateTime"])
      next if steps_object.nil?
      steps_object.steps = day["value"].nil? ?  0 : day["value"]
      steps_object.save!
    end

    # active_minutes data
    active_minutes_info.each do |day|
      active_minutes_object = FitbitScore.find_by(logdate: day["dateTime"])
      next if active_minutes_object.nil?
      active_minutes_object.active_minutes = day["value"].nil? ?  0 : day["value"]
      active_minutes_object.save!
    end

    # stores exercise_km data
    exercise_km_info.each do |day|
      exercise_km_object = FitbitScore.find_by(logdate: day["dateTime"])
      next if exercise_km_object.nil?
      exercise_km_object.exercise_km = day["value"].nil? ?  0 : day["value"]
      exercise_km_object.save!
    end

    # stores exercise_time data
    exercise_time_info.each do |day|
      exercise_time_object = FitbitScore.find_by(logdate: day["dateTime"])
      next if exercise_time_object.nil?
      exercise_time_object.exercise_time = day["value"].nil? ?  0 : day["value"]
      exercise_time_object.save!
    end

    # stores exercise_cal data
    exercise_cal_info.each do |day|
      exercise_cal_object = FitbitScore.find_by(logdate: day["dateTime"])
      next if exercise_cal_object.nil?
      exercise_cal_object.exercise_cal = day["value"].nil? ?  0 : day["value"]
      exercise_cal_object.save!
    end

    # stores exercise_type data
    exercise_type_info.each do |day|
      exercise_type_object = FitbitScore.find_by(logdate: day["dateTime"])
      next if exercise_type_object.nil?
      exercise_type_object.exercise_type = day["value"].nil? ?  0 : day["value"]
      exercise_type_object.save!
    end

    # # stores diet_cal data
    # diet_cal_info.each do |day|
    #   diet_cal_object = FitbitScore.find_by(logdate: day["dateTime"])
    #   next if diet_cal_object.nil?
    #   diet_cal_object.diet_cal = day["value"].nil? ?  0 : day["value"]
    #   diet_cal_object.save!
    # end

    # # stores water data
    # water_info.each do |day|
    #   water_object = FitbitScore.find_by(logdate: day["dateTime"])
    #   next if water_object.nil?
    #   water_object.water = day["value"].nil? ?  0 : day["value"]
    #   water_object.save!
    # end
    FitbitScore.where(user: self).each do |score|
      log = client.food_logs(score.logdate)
      score.fat = log["summary"]["fat"]
      score.carbs = log["summary"]["carbs"]
      score.fiber = log["summary"]["fiber"]
      score.protein = log["summary"]["protein"]
      score.sodium = log["summary"]["sodium"]
      score.water = log["summary"]["water"]
      score.diet_cal = log["summary"]["calories"]

      score.save!
      score.algorithm_v2
    end

  end

  def fecth_new_data
    fibit_client
    #.bla, bla call all the methods we need and store them in the table fitbit_score
  end

  def assign_age
    current_year = Time.new.year
    self.age = current_year - self.dob.year
  end

end
