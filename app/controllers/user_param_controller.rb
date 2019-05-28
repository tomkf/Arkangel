class UserParamController < ApplicationController
end







#################################################################
#################################################################
#################################################################


grams_d_of_cereal_fiber = 15
serving_d_of_soda = 0
serving_d_of_meat = 0.8

def fruit_and_veggies
  serving_d_of_fruit = 2
  serving_d_of_vegetables = 1

  if (serving_d_of_vegetables + serving_d_of_fruit) > 2
    0.18283
  elsif (serving_d_of_vegetables + serving_d_of_fruit) >= 1
    0.14522
  else # should we return 0 here?
    0
  end
end

def nuts
  serving_d_of_nuts = 1

  if serving_d_of_nuts > 1
    return 0.2444
  else
     return 0
  end
end

diet_score = (0.03626 * grams_d_of_cereal_fiber
  + fruit_and_veggies
  - 0.14631 * serving_d_of_soda
  + nuts
  - 0.15624 * serving_d_of_meat) * 10

puts 'Diet score is: '
puts diet_score

age = 25
def smoker
  past_smoker = false
  current_smoker = false
  value = 0

  if current_smoker
    value += 0.90138
  end

  if past_smoker
    value += 0.15285
  end

  value
end

height = 177
weight = 74
bmi = (weight / height / height) * 10000

grams_of_alco = 20
weekly_hours_exercise = 3.5

W = 0.10820 * age + smoker + 0.04676 * bmi - 0.01923 *
(grams_of_alco * grams_of_alco) - 0.029251 * weekly_hours_exercise - 0.05113 * diet_score

puts 'W is...'
puts W
puts 'risk is....'

we = 0.9660**(W - 6.57301)

risk = (we - 1) * 100
puts risk
