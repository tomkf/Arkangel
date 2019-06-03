class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @userno = current_user
  end

  def dashboard
    if params[:apis_params] == 'true'
      sleep 3
    end

    @user = current_user

    if @user.user_scores.length != 0
      @health_score = @user.user_scores.last.health_score
      @bmi = bmi(@user)
      @physical_activity = physical_activity(@user)
      @fruits_vegetables = fruits_vegetables(@user)
      @whole_grains = whole_grains(@user)
      @red_meat = red_meat(@user)
      @processed_meat = processed_meat(@user)
      @fats = fats(@user)
      @soda = soda(@user)
      @alcohol = alcohol(@user)
      @feedback = [@bmi, @physical_activity, @fruits_vegetables, @whole_grains, @red_meat, @processed_meat, @fats, @soda, @alcohol]
    end
  end

  def apis

  end

  private

  # methods to get the specific feedback
  # each method returns an array with the [name_of_category, icon_path, message, clasifier]

  def bmi(user)
    message = ["weight", "vitals/2_Weight.png"]
    if user.user_scores.last.bmi <= 24.9
      message << "Your BMI category is healthy based on the World Health Organization criteria for adults."
      message << "great"
    elsif user.user_scores.last.bmi.between?(25, 29.9)
      message << "Your BMI category is overweight based on the World Health Organization criteria."
      message << "average"
    else
      message << "Your BMI category is obese based on the World Health Organization criteria."
      message << "low"
    end
    return message
  end

  def physical_activity(user)
    message = ["workout", "vitals/6_Workout.png"]
    if user.user_scores.last.physical_activity >= 0.5
      message << "You are in the healthiest category for physical activity. You meet current physical activity recommendations. Keep up the great work!"
      message << "great"
    elsif user.user_scores.last.physical_activity.between?(0.1, 0.4)
      message << "You are on your way to an active lifestyle, but increasing your physical activity will provide more cardiovascular health benefits."
      message << "average"
    else
      message << "Set a goal to increase your physical activity"
      message << "low"
    end
    return message
  end

  def fruits_vegetables(user)
    message = ["fruits & veggies", "vitals/4_Energy.png"]
    if user.user_scores.last.fruits_vegetables >= 4
      message << "You are in the healthiest category for fruit and vegetable intake based on the study population."
      message << "great"
    elsif user.user_scores.last.fruits_vegetables.between?(2, 3.9)
      message << "You are on your way to a healthy fruit and vegetables intake. Try to reach 4 servings a day of vegetables and fruits to get the best benefits."
      message << "average"
    else
      message << "Set a goal to increase your intake of fruits and vegetables."
      message << "low"
    end
    return message
  end

  def whole_grains(user)
    message = ["fiber", "vitals/11_Fibers.png"]
    if user.user_scores.last.whole_grains >= 15
      message << "You have a diet high in whole grain fiber."
      message << "great"
    elsif user.user_scores.last.whole_grains.between?(7, 14.9)
      message << "You are on your way to a diet high in whole grain fiber, and increasing intake could provide more cardiovascular health benefits."
      message << "average"
    else
      message << "You have a low intake of grain fiber, this increases the risk of heart disease"
      message << "low"
    end
    return message
  end

  def red_meat(user)
    message = ["meat", "vitals/13_Red.png"]
    if user.user_scores.last.red_meat <= 2
      message << "You have a low intake of red meat. Keep it up!"
      message << "great"
    elsif user.user_scores.last.red_meat.between?(2.1, 5)
      message << "You would benefit from reducing your intake of red meat."
      message << "average"
    else
      message << "Set a goal to reduce your intake of red meat."
      message << "low"
    end
    return message
  end

  def processed_meat(user)
    message = ["meat", "vitals/9_Processed.png"]
    if user.user_scores.last.processed_meat >= 0
      message << "You have the healthiest intake of processed meat."
      message << "great"
    elsif user.user_scores.last.processed_meat.between?(3, 4.9)
      message << "Set a goal to reduce your intake of processed meat to 0 servings a day."
      message << "average"
    else
      message << "Set a goal to reduce your intake of processed meat."
      message << "low"
    end
    return message
  end

  def fats(user)
    message = ["fats", "vitals/14_Fats.png"]
    if user.user_scores.last.fats >= 1
      message << "You have a healthy intake of nuts and seeds."
      message << "great"
    elsif user.user_scores.last.fats.between?(0.5, 0.9)
      message << "Increasing your intake of nuts and seeds to at least 1 oz/day can provide additional health benefits."
      message << "average"
    else
      message << "You have a low intake of nuts. Set a goal to eat at least 1 a day"
      message << "low"
    end
    return message
  end

  def soda(user)
    message = ["sugar", "vitals/10_Sugar.png"]
    if user.user_scores.last.soda <= 0
      message << "You are in the healthiest category for sugar-sweetened drinks."
      message << "great"
    elsif user.user_scores.last.soda.between?(0.1, 1)
      message << "Decreasing your intake of sugary beverages would provide health benefits."
      message << "average"
    else
      message << "Set a goal to decrease your intake of sugary beverages."
      message << "low"
    end
    return message
  end

  def alcohol(user)
    message = ["alcohol", "vitals/8_Alcohol.png"]
    if user.user_scores.last.alcohol <= 1
      message << "You are drinking the right amount of alcohol for ultimate health benefits."
      message << "great"
    elsif user.user_scores.last.alcohol.between?(2.1, 4)
      message << "Your alcohol intake is higher than what is recommended for overall health. High alcohol intake may increase the risk for diseases like cancer."
      message << "average"
    else
      message << "Your alcohol intake is excessive, reduce it to prevent disease like cancer."
      message << "low"
    end
    return message
  end
end
