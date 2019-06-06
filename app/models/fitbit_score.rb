class FitbitScore < ApplicationRecord
  belongs_to :user
  # after_create :algorithm_v2

  def algorithm_v2
    stress_const = 4
    exercise_const = 7
    diet_const = 10
    sleep_const = 5

    w_score = age_clasifier(self.user.age) + smoker_clasifier(self.user.smoker) + bmi_clasifier(self.bmi) + (stress_calculator(self.heart_rate) * stress_const) + (exercise_calculator * exercise_const) + (sleep_calculator * sleep_const) + (diet_calculator * diet_const)
    if w_score <= 6.6
      self.health_score = 0
    else
      self.health_score = (1 - 0.9660**(w_score - 6.57301)) * 100
    end

    self.save!
    puts 'score added!'
    p self.health_score
  end

  def age_clasifier(age)
    if age <= 34
      age * 0.6032
    elsif age.between?(35, 44)
      age * 0.4082
    elsif age.between?(45, 54)
      age * 0.1082
    elsif age.between?(55, 64)
      age * 0.05082
    elsif age >= 65
      age * 0.03082
    end
  end

  def smoker_clasifier(message)
    if message == 'past'
      -0.15285
    elsif message == 'current'
      -0.90138
    else
      1
    end
  end

  def bmi_clasifier(bmi)
    if bmi.present?
      if bmi >= 35
        bmi * -1.04676
      elsif bmi.between?(25.1, 30)
        bmi * -0.52338
      else
        bmi * 1.04676
      end
    else
      bmi_clasifier(bmi_calculator)
    end
  end

  def bmi_calculator
    self.bmi = self.user.user_params.last.weight.to_f / (self.user.user_params.last**2)
    return self.bmi
  end

  def stress_calculator(heart_rate)
    optimal_heart_rate = 80.0
    if heart_rate >= 100
      score = heart_rate / optimal_heart_rate * 1 # Low category
    elsif heart_rate <= 70
      score = heart_rate / optimal_heart_rate * 3 # Medium category
    else
      score = heart_rate / optimal_heart_rate * 4 # Great category
    end

    self.update!(stress_score: score)
    return score
  end

  def sleep_calculator
    # ideal way should have decorators folder to simplify the code = gem 'draper'
    # overall_sleep clasifier

    optimal_overall_sleep = 480.0 # in minutes
    if self.overall_sleep <= 421
      overall_sleep_score = self.overall_sleep / optimal_overall_sleep * -0.896 # Low category
    elsif self.overall_sleep >= 481
      overall_sleep_score = self.overall_sleep / optimal_overall_sleep * 0.696 # Medium category
    elsif self.overall_sleep.between?(420, 480)
      overall_sleep_score = self.overall_sleep / optimal_overall_sleep * 1.296 # Great category
    end

    # awaken_sleep clasifier
    # if self.awaken_sleep == 0
    #   self.awaken_sleep = self.overall_sleep * 35 / self.overall_sleep.to_f
    # end

    optimal_awaken_sleep = optimal_overall_sleep * 5 / 100.0 # 5% of the overall total sleep
    awaken_percentage = self.overall_sleep == 0 ? 0 : self.awaken_sleep * 100 / self.overall_sleep.to_f # transforms to percentage the value
    if awaken_percentage >= 5.6
      awaken_sleep_score = self.awaken_sleep / optimal_awaken_sleep * -0.0021 # Low category
    elsif awaken_percentage.between?(5.1, 5.5)
      awaken_sleep_score = self.awaken_sleep / optimal_awaken_sleep * 0.07272 # Medium category
    elsif awaken_percentage <= 5.0
      awaken_sleep_score = self.awaken_sleep / optimal_awaken_sleep * 0.13272 # Great category
    end

    # REM_sleep clasifier
    optimal_rem_sleep = optimal_overall_sleep * 35 / 100.0 # 35% of the overall total sleep
    rem_percentage = self.overall_sleep == 0 ? 0 : self.rem_sleep * 100 / self.overall_sleep.to_f # transforms to percentage the value
    if rem_percentage <= 29
      rem_sleep_score = self.rem_sleep / optimal_rem_sleep * -1.15912 # Low category
    elsif rem_percentage.between?(30, 34.9)
      rem_sleep_score = self.rem_sleep / optimal_rem_sleep * 0.95912 # Medium category
    elsif rem_percentage >= 35
      rem_sleep_score = self.rem_sleep / optimal_rem_sleep * 1.15912 # Great category
    end

    # light_sleep clasifier
    optimal_light_sleep = optimal_overall_sleep * 40 / 100.0 # 40% of the overall total sleep
    light_percentage = self.overall_sleep == 0 ? 0 : self.light_sleep * 100 / self.overall_sleep.to_f # transforms to percentage the value
    if light_percentage >= 45.1
      light_sleep_score = self.light_sleep / optimal_light_sleep * 0.00323 # Low category
    elsif light_percentage.between?(40.1, 45)
      light_sleep_score = self.light_sleep / optimal_light_sleep * 0.01998 # Medium category
    elsif light_percentage <= 40
      light_sleep_score = self.light_sleep / optimal_light_sleep * 0.62016 # Great category
    end

    # deep_sleep clasifier
    optimal_deep_sleep = optimal_overall_sleep * 20 / 100.0 # 20% of the overall total sleep
    deep_percentage = self.overall_sleep == 0 ? 0 : self.deep_sleep * 100 / self.overall_sleep.to_f # transforms to percentage the value
    if deep_percentage <= 15
      deep_sleep_score = self.deep_sleep / optimal_deep_sleep * 0.32456 # Low category
    elsif deep_percentage.between?(15.1, 19.9)
      deep_sleep_score = self.deep_sleep / optimal_deep_sleep * 0.67876 # Medium category
    elsif deep_percentage >= 20
      deep_sleep_score = self.deep_sleep / optimal_deep_sleep * 0.87264 # Great category
    end

    score = overall_sleep_score + awaken_sleep_score + rem_sleep_score + light_sleep_score + deep_sleep_score # adds everything
    self.update!(sleep_score: score)
    return score
  end

  def exercise_calculator
    # steps clasifier
    optimal_steps = 10000.0
    if self.steps <= 7000
      steps_score = self.steps / optimal_steps * 1.59 # Low category
    elsif self.steps.between?(7001, 9999)
      steps_score = self.steps / optimal_steps * 1.89 # Medium category
    elsif self.steps >= 10000
      steps_score = self.steps / optimal_steps * 2.09 # Great category
    end

    # active minutes clasifier
    optimal_active_minutes = 30.0
    if self.active_minutes <= 15
      active_minutes_score = self.active_minutes / optimal_active_minutes * 0.078 # Low category
    elsif self.active_minutes.between?(16, 29)
      active_minutes_score = self.active_minutes / optimal_active_minutes * 0.101 # Medium category
    elsif self.active_minutes >= 30
      active_minutes_score = self.active_minutes / optimal_active_minutes * 0.177 # Great category
    end

    # floors clasifier
    optimal_floors = 5.0
    if self.floors <= 2
      floors_score = self.floors / optimal_floors * 0.067 # Low category
    elsif self.floors.between?(2.1, 4.9)
      floors_score = self.floors / optimal_floors * 0.101 # Medium category
    elsif self.floors >= 5
      floors_score = self.floors / optimal_floors * 0.121 # Great category
    end

    # exercise_km clasifier
    optimal_exercise_km = 8.0
    if self.exercise_km <= 2.9
      exercise_km_score = self.exercise_km / optimal_exercise_km * 0.1875 # Low category
    elsif self.exercise_km.between?(3.0, 7.9)
      exercise_km_score = self.exercise_km / optimal_exercise_km * 0.2875 # Medium category
    elsif self.exercise_km >= 8
      exercise_km_score = self.exercise_km / optimal_exercise_km * 0.3875 # Great category
    end

    # exercise_time clasifier
    optimal_exercise_time = 30.0
    if self.exercise_time <= 15
      exercise_time_score = self.exercise_time / optimal_exercise_time * 0.078 # Low category
    elsif self.exercise_time.between?(16, 29)
      exercise_time_score = self.exercise_time / optimal_exercise_time * 0.101 # Medium category
    elsif self.exercise_time >= 30
      exercise_time_score = self.exercise_time / optimal_exercise_time * 0.177 # Great category
    end

    # exercise_cal clasifier
    optimal_exercise_cal = 2300.0
    if self.exercise_cal <= 2499
      exercise_cal_score = self.exercise_cal / optimal_exercise_cal * 0.078 # Low category
    elsif self.exercise_cal.between?(2500, 2999)
      exercise_cal_score = self.exercise_cal / optimal_exercise_cal * 0.145 # Medium category
    elsif self.exercise_cal >= 3000
      exercise_cal_score = self.exercise_cal / optimal_exercise_cal * 0.874 # Great category
    end

    score = steps_score + floors_score + active_minutes_score + exercise_km_score + exercise_time_score + exercise_cal_score # adds everything
    self.update!(exercise_score: score)
    return score
  end

  def diet_calculator
    # alcohol_ml clasifier
    optimal_alcohol_ml = 40.0
    if self.alcohol_ml >= 80.1
      alcohol_ml_score = self.alcohol_ml / optimal_alcohol_ml * -0.078 # Low category
    elsif self.alcohol_ml.between?(40.1, 80)
      alcohol_ml_score = self.alcohol_ml / optimal_alcohol_ml * 0.101 # Medium category
    elsif self.alcohol_ml <= 40
      alcohol_ml_score = self.alcohol_ml / optimal_alcohol_ml * 0.874 # Great category
    end

    # water clasifier
    optimal_water = 3500.0
    if self.water <= 2499
      water_score = self.water / optimal_water * -0.078 # Low category
    elsif self.water.between?(2500, 3499)
      water_score = self.water / optimal_water * 0.101 # Medium category
    elsif self.water >= 3500
      water_score = self.water / optimal_water * 0.874 # Great category
    end

    # carbs clasifier
    optimal_carbs = 325.0
    if self.carbs <= 129.9
      carbs_score = self.carbs / optimal_carbs * 0.4 # Low category
    elsif self.carbs.between?(130, 324.9)
      carbs_score = self.carbs / optimal_carbs * 0.72 # Medium category
    elsif self.carbs >= 325
      carbs_score = self.carbs / optimal_carbs * 0.9431 # Great category
    end

    # fat clasifier
    optimal_fat = 78.0
    if self.fat >= 100.1
      fat_score = self.fat / optimal_fat * -0.8283 # Low category
    elsif self.fat.between?(78.1, 100)
      fat_score = self.fat / optimal_fat * 0.424 # Medium category
    elsif self.fat <= 78
      fat_score = self.fat / optimal_fat * 0.8283 # Great category
    end

    # fiber clasifier
    optimal_fiber = 38
    if self.fiber <= 24.9
      fiber_score = self.fiber / optimal_fiber * 0.50626 # Low category
    elsif self.fiber.between?(25, 37.9)
      fiber_score = self.fiber / optimal_fiber * 0.70626 # Medium category
    elsif self.fiber >= 38
      fiber_score = self.fiber / optimal_fiber * 0.80626 # Great category
    end

    # protein clasifier
    optimal_protein = 56
    if self.protein <= 29.9
      protein_score = self.protein / optimal_protein * 0.4567 # Low category
    elsif self.protein.between?(30, 55.9)
      protein_score = self.protein / optimal_protein * 0.7877 # Medium category
    elsif self.protein >= 56
      protein_score = self.protein / optimal_protein * 0.9678 # Great category
    end

    # sodium clasifier
    optimal_sodium = 2.3
    if self.sodium >= 7.7
      sodium_score = self.sodium / optimal_sodium * -0.07252 # Low category
    elsif self.sodium.between?(2.4, 7.6)
      sodium_score = self.sodium / optimal_sodium * -0.03626 # Medium category
    elsif self.sodium <= 2.3
      sodium_score = self.sodium / optimal_sodium * 0 # Great category
    end

    # sugar clasifier
    optimal_sugar = 37.0
    if self.sugar >= 80.1
      sugar_score = self.sugar / optimal_sugar * -0.29262 # Low category
    elsif self.sugar.between?(37.1, 80)
      sugar_score = self.sugar / optimal_sugar * -0.14631 # Medium category
    elsif self.sugar <= 37
      sugar_score = self.sugar / optimal_sugar * 0 # Great category
    end

    # cholesterol clasifier
    optimal_cholesterol = 13.0
    if self.cholesterol >= 27.1
      cholesterol_score = self.cholesterol / optimal_cholesterol * -0.36566 # Low category
    elsif self.cholesterol.between?(13.1, 27)
      cholesterol_score = self.cholesterol / optimal_cholesterol * -0.18283 # Medium category
    elsif self.cholesterol <= 13
      cholesterol_score = self.cholesterol / optimal_cholesterol * 0 # Great category
    end

    # diet_cal clasifier
    optimal_diet_cal = 2300.0
    if self.diet_cal >= 27.1
      diet_cal_score = self.diet_cal / optimal_diet_cal * -0.60502 # Low category
    elsif self.diet_cal.between?(2301, 2500)
      diet_cal_score = self.diet_cal / optimal_diet_cal * -0.30251 # Medium category
    elsif self.diet_cal <= 2300
      diet_cal_score = self.diet_cal / optimal_diet_cal * 0 # Great category
    end

    score = alcohol_ml_score + diet_cal_score + cholesterol_score + sugar_score + sodium_score + water_score + carbs_score + protein_score + fat_score + fiber_score
    self.update!(diet_score: score)
    return score
  end
end
