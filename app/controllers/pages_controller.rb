class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @userno = current_user
  end

  def dashboard

    @user = current_user

    if @user.fitbit_scores.length != 0

      @health_score = @user.fitbit_scores.last.health_score
      @water = water(@user)
      @sleep_h = sleep_h(@user)
      @fat = fat(@user)
      @fiber = fiber(@user)
      @protein = protein(@user)
      @sugar = sugar(@user)
      @exercise = exercise(@user)
      @alcohol = alcohol(@user)
      @heart_rate = heart_rate(@user)
      @feedback = [@water, @sleep_h, @fat, @fiber, @protein, @sugar, @exercise, @alcohol, @heart_rate]
    end
  end

  def apis
    client = FitbitAPI::Client.new(
      client_id: ENV["FITBIT_ID"],
      client_secret: ENV["FITBIT_SECRET"],
      redirect_uri: ENV["FITBIT_REDIRECT_URL"]
    )
    @fitbit_url = client.auth_url
  end

  private

  # methods to get the specific feedback
  # each method returns an array with the [name_of_category, icon_path, message, clasifier]

  def water(user)
    message = ["water", "vitals/15_Water.png"]
    if user.fitbit_scores.last.water >= 3500
      message << "Today you've had plenty of water, keep it up!"
      message << "great"
    elsif user.fitbit_scores.last.water.between?(2500, 3499)
      message << "Your water intake is a bit low, drink more water each day."
      message << "average"
    else
      message << "Your water intake is very low."
      message << "low"
    end
    return message
  end

  def sleep_h(user)
    message = ["sleep", "vitals/16_Sleep.png"]
    if user.fitbit_scores.last.overall_sleep < 420
      message << "Last night you only got #{user.fitbit_scores.last.overall_sleep} minutes of sleep. Most adults should target around 480 minutes."
      message << "low"
    elsif user.fitbit_scores.last.overall_sleep.between?(420, 480)
      message << "Last night you got #{user.fitbit_scores.last.overall_sleep} minutes of sleep. Excellent!"
      message << "great"
    else
      message << "Last night you got #{user.fitbit_scores.last.overall_sleep} minutes of sleep."
      message << "average"
    end
    return message
  end

  def fat(user)
    message = ["Fat", "vitals/9_Processed.png"]
    if user.fitbit_scores.last.fat > 100
      message << "Your fat intake is high (#{user.fitbit_scores.last.fat.round} g.) Target less than 79 grams."
      message << "low"
    elsif user.fitbit_scores.last.fat.between?(78.1, 100)
      message << "Your fat intake is a bit high. Today you've had #{user.fitbit_scores.last.fat.round} grams of fat. Target less than 79 grams."
      message << "average"
    else
      message << "Your fat intake is at an optimal level."
      message << "great"
    end
    return message
  end

  def fiber(user)
    message = ["fiber", "vitals/11_Fibers.png"]
    if user.fitbit_scores.last.fiber >= 38
      message << "You have a diet high in fibers."
      message << "great"
    elsif user.fitbit_scores.last.fiber.between?(25, 37.9)
      message << "You are on your way to a diet high fibers, and increasing intake could provide more cardiovascular health benefits."
      message << "average"
    else
      message << "You have a low intake of fiber, this increases the risk of heart disease."
      message << "low"
    end
    return message
  end

  def protein(user)
    message = ["protein", "vitals/13_Red.png"]
    if user.fitbit_scores.last.protein > 56
      message << "You have a high intake of protein. Keep it up!"
      message << "great"
    elsif user.fitbit_scores.last.protein.between?(30, 55.9)
      message << "You could benefit from eating more protein. Your intake so far today is #{user.fitbit_scores.last.protein.round} grams."
      message << "average"
    else
      message << "Your protein intake is very low. Try to target at least 30 grams a day!"
      message << "low"
    end
    return message
  end

  def sugar(user)
    message = ["sugar", "vitals/10_Sugar.png"]
    if user.fitbit_scores.last.sugar > 80
      message << "You have a very high intake of sugar. Today we have logged #{user.fitbit_scores.last.sugar.round} grams of sugar. Try to eat less than 37 grams."
      message << "low"
    elsif user.fitbit_scores.last.sugar.between?(37.1, 80)
      message << "Set a goal to reduce your intake of sugar."
      message << "average"
    else
      message << "Your intake of sugar is at a healthy level."
      message << "great"
    end
    return message
  end

  def exercise(user)
    message = ["exercise", "vitals/6_Workout.png"]

    last_exercise = ''
    if user.fitbit_scores.last.exercise_type.present?
      last_exercise = "Your last exercise: #{user.fitbit_scores.last.exercise_type}."
    end

    if user.fitbit_scores.last.active_minutes > 30
      message << "#{last_exercise} So far you have #{user.fitbit_scores.last.active_minutes} active minutes today."
      message << "great"
    elsif user.fitbit_scores.last.active_minutes.between?(16, 29)
      message << "#{last_exercise} So far you have #{user.fitbit_scores.last.active_minutes} active minutes today.
      Try to get at least 30 active minutes per day."
      message << "average"
    else
      message << "Today you only have #{user.fitbit_scores.last.active_minutes} active minutes. You need to exercise more!"
      message << "low"
    end
    return message
  end

  def alcohol(user)
    message = ["alcohol", "vitals/8_Alcohol.png"]
    if user.fitbit_scores.last.alcohol_ml < 40
      message << "You have a healthy intake of alcohol."
      message << "great"
    elsif user.fitbit_scores.last.alcohol_ml.between?(40, 80)
      message << "Decreasing your intake of alcohol would provide health benefits."
      message << "average"
    else
      message << "Your intake of alcohol is at a very high level."
      message << "low"
    end
    return message
  end

  def heart_rate(user)
    message = ["heart rate", "vitals/1_Heart.png"]
    if user.fitbit_scores.last.heart_rate > 100
      message << "Your average heart rate today was #{user.fitbit_scores.last.heart_rate}, which is very high. Please consult with your doctor."
      message << "low"
    elsif user.fitbit_scores.last.heart_rate.between?(70, 100)
      message << "Your heart rate averaged around #{user.fitbit_scores.last.heart_rate} today. This is within the healthy range."
      message << "great"
    else
      message << "Your average heart rate was low today."
      message << "average"
    end
    return message
  end
end
