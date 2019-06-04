
puts 'Wiping database...'
UserScore.destroy_all
User.destroy_all


puts 'Creating users'

user = User.create!(email: 'gustaf@email.com', first_name: "wolfgang", last_name: "mozart", password: '123456', age: 38, smoker: 'never')
user_params = UserParams.create!(bmi: 30, weight: , height: )

puts 'Adding user score...'

# Add score

exercise_array = ["jogging", "brisk walk", "swimming", "weights" ]



poor_hash = { user: user,
  bmi: 30,
  overall_sleep: rand(280..350),
  awaken_sleep: 35,
  rem_sleep: 50,
  light_sleep: 15,
  deep_sleep: 28,
  heart_rate: rand(70..110),
  steps: rand(3500..8000),
  active_minutes: rand(5..25),
  exercise_type: exercise_array[rand(0..3)],
  floors: rand(0..5),
  exercise_time: rand(5..25),
  exercise_km: rand(0..6),
  exercise_cal: rand(1000..2600)
  water: rand(1800..2800),
  carbs: rand(80..360),
  fat: 80,
  fiber: 30,
  protein: 37,
  sodium: 3,
  sugar: 50,
  cholesterol: 20,
  diet_cal: 2800,
  alcohol_ml: 60,
  logdate: '2019-06-01'}

average_hash = { user: user,
  bmi: 30,
  overall_sleep: 360,
  awaken_sleep: 35,
  rem_sleep: 50,
  light_sleep: 15,
  deep_sleep: 28,
  heart_rate: 70,
  steps: 6000,
  active_minutes: 25,
  exercise_type: "yoga",
  floors: 5,
  exercise_time: 25,
  exercise_km: 5,
  exercise_cal: 300,
  water: 2500,
  carbs: 400,
  fat: 80,
  fiber: 30,
  protein: 37,
  sodium: 3,
  sugar: 50,
  cholesterol: 20,
  diet_cal: 2800,
  alcohol_ml: 60,
  logdate: '2019-06-01' }

good_hash = { user: user,
  bmi: 30,
  overall_sleep: 360,
  awaken_sleep: 35,
  rem_sleep: 50,
  light_sleep: 15,
  deep_sleep: 28,
  heart_rate: 70,
  steps: 6000,
  active_minutes: 25,
  exercise_type: "yoga",
  floors: 5,
  exercise_time: 25,
  exercise_km: 5,
  exercise_cal: 300,
  water: 2500,
  carbs: 400,
  fat: 80,
  fiber: 30,
  protein: 37,
  sodium: 3,
  sugar: 50,
  cholesterol: 20,
  diet_cal: 2800,
  alcohol_ml: 60,
  logdate: '2019-06-01'}

10.times do
FitbitScore.create!(poor_hash)
end

15.times do
FitbitScore.create!(average_hash)
end

5.times do
FitbitScore.create!(good_hash)
end

# # BAD AND SEMI BAD DAYS
# UserScore.create!(
#   user: user,
#   bmi: 30,
#   physical_activity: 0, # hours per day
#   fruits_vegetables: 0, # servings per day
#   whole_grains: 5, # grams per day
#   red_meat: 2, # servings per day
#   processed_meat: 2, # servings per day
#   fats: 0, # servings per day
#   soda: 5, # drinks per day
#   alcohol: 5, # drinks per day
#   logdate: '2019-05-01'
#   )

# UserScore.create!(
#   user: user,
#   bmi: 29.5,
#   physical_activity: 0, # hours per day
#   fruits_vegetables: 1, # servings per day
#   whole_grains: 5, # grams per day
#   red_meat: 2, # servings per day
#   processed_meat: 2, # servings per day
#   fats: 0, # servings per day
#   soda: 5, # drinks per day
#   alcohol: 5, # drinks per day
#   logdate: '2019-05-02'
#   )
# UserScore.create!(
#   user: user,
#   bmi: 30,
#   physical_activity: 0.1, # hours per day
#   fruits_vegetables: 0, # servings per day
#   whole_grains: 5, # grams per day
#   red_meat: 2, # servings per day
#   processed_meat: 1, # servings per day
#   fats: 0.2, # servings per day
#   soda: 3, # drinks per day
#   alcohol: 3, # drinks per day
#   logdate: '2019-05-03'
#   )
# UserScore.create!(
#   user: user,
#   bmi: 29.3,
#   physical_activity: 0.1, # hours per day
#   fruits_vegetables: 0, # servings per day
#   whole_grains: 5, # grams per day
#   red_meat: 2, # servings per day
#   processed_meat: 1, # servings per day
#   fats: 0.3, # servings per day
#   soda: 3, # drinks per day
#   alcohol: 3, # drinks per day
#   logdate: '2019-05-04'
#   )

# UserScore.create!(
#   user: user,
#   bmi: 29.3,
#   physical_activity: 0.2, # hours per day
#   fruits_vegetables: 0, # servings per day
#   whole_grains: 5, # grams per day
#   red_meat: 2, # servings per day
#   processed_meat: 1, # servings per day
#   fats: 0.3, # servings per day
#   soda: 3, # drinks per day
#   alcohol: 3, # drinks per day
#   logdate: '2019-05-05'
#   )
# UserScore.create!(
#   user: user,
#   bmi: 29,
#   physical_activity: 0.3, # hours per day
#   fruits_vegetables: 0, # servings per day
#   whole_grains: 5, # grams per day
#   red_meat: 2, # servings per day
#   processed_meat: 1, # servings per day
#   fats: 0.3, # servings per day
#   soda: 3, # drinks per day
#   alcohol: 3, # drinks per day
#   logdate: '2019-05-06'
#   )
# UserScore.create!(
#   user: user,
#   bmi: 29,
#   physical_activity: 0.3, # hours per day
#   fruits_vegetables: 0, # servings per day
#   whole_grains: 5, # grams per day
#   red_meat: 2, # servings per day
#   processed_meat: 1, # servings per day
#   fats: 0.3, # servings per day
#   soda: 3, # drinks per day
#   alcohol: 3, # drinks per day
#   logdate: '2019-05-07'
#   )
# UserScore.create!(
#   user: user,
#   bmi: 29,
#   physical_activity: 0.3, # hours per day
#   fruits_vegetables: 0, # servings per day
#   whole_grains: 5, # grams per day
#   red_meat: 2, # servings per day
#   processed_meat: 1, # servings per day
#   fats: 0.3, # servings per day
#   soda: 3, # drinks per day
#   alcohol: 3, # drinks per day
#   logdate: '2019-05-08'
#   )
# UserScore.create!(
#   user: user,
#   bmi: 29,
#   physical_activity: 0.3, # hours per day
#   fruits_vegetables: 0, # servings per day
#   whole_grains: 5, # grams per day
#   red_meat: 2, # servings per day
#   processed_meat: 1, # servings per day
#   fats: 0.3, # servings per day
#   soda: 3, # drinks per day
#   alcohol: 1, # drinks per day
#   logdate: '2019-05-09'
#   )
# UserScore.create!(
#   user: user,
#   bmi: 29,
#   physical_activity: 0.4, # hours per day
#   fruits_vegetables: 0, # servings per day
#   whole_grains: 5, # grams per day
#   red_meat: 2, # servings per day
#   processed_meat: 1, # servings per day
#   fats: 0.3, # servings per day
#   soda: 2, # drinks per day
#   alcohol: 2, # drinks per day
#   logdate: '2019-05-10'
#   )

# # NEUTRAL DAYS
# UserScore.create!(
#   user: user,
#   bmi: 29,
#   physical_activity: 0.3, # hours per day
#   fruits_vegetables: 2, # servings per day
#   whole_grains: 10, # grams per day
#   red_meat: 1.5, # servings per day
#   processed_meat: 0.5, # servings per day
#   fats: 0.5, # servings per day
#   soda: 1, # drinks per day
#   alcohol: 1, # drinks per day
#   logdate: '2019-05-11'
#   )

# UserScore.create!(
#   user: user,
#   bmi: 28.9,
#   physical_activity: 0.3, # hours per day
#   fruits_vegetables: 2, # servings per day
#   whole_grains: 10, # grams per day
#   red_meat: 1.5, # servings per day
#   processed_meat: 0.5, # servings per day
#   fats: 0.5, # servings per day
#   soda: 1, # drinks per day
#   alcohol: 1, # drinks per day
#   logdate: '2019-05-12'
#   )

# UserScore.create!(
#   user: user,
#   bmi: 28.7,
#   physical_activity: 0.3, # hours per day
#   fruits_vegetables: 2, # servings per day
#   whole_grains: 10, # grams per day
#   red_meat: 1.5, # servings per day
#   processed_meat: 0.5, # servings per day
#   fats: 0.5, # servings per day
#   soda: 1, # drinks per day
#   alcohol: 1, # drinks per day
#   logdate: '2019-05-13'
#   )

# UserScore.create!(
#   user: user,
#   bmi: 28.6,
#   physical_activity: 0.3, # hours per day
#   fruits_vegetables: 2, # servings per day
#   whole_grains: 10, # grams per day
#   red_meat: 1.5, # servings per day
#   processed_meat: 0.5, # servings per day
#   fats: 0.5, # servings per day
#   soda: 1, # drinks per day
#   alcohol: 1, # drinks per day
#   logdate: '2019-05-14'
#   )

# UserScore.create!(
#   user: user,
#   bmi: 28.5,
#   physical_activity: 0.3, # hours per day
#   fruits_vegetables: 2, # servings per day
#   whole_grains: 10, # grams per day
#   red_meat: 1.5, # servings per day
#   processed_meat: 0.5, # servings per day
#   fats: 0.5, # servings per day
#   soda: 1, # drinks per day
#   alcohol: 1, # drinks per day
#   logdate: '2019-05-15'
#   )

# UserScore.create!(
#   user: user,
#   bmi: 28.9,
#   physical_activity: 0.3, # hours per day
#   fruits_vegetables: 2, # servings per day
#   whole_grains: 10, # grams per day
#   red_meat: 1.5, # servings per day
#   processed_meat: 0.5, # servings per day
#   fats: 0.5, # servings per day
#   soda: 1, # drinks per day
#   alcohol: 1, # drinks per day
#   logdate: '2019-05-16'
#   )

# UserScore.create!(
#   user: user,
#   bmi: 28.6,
#   physical_activity: 0.3, # hours per day
#   fruits_vegetables: 2, # servings per day
#   whole_grains: 10, # grams per day
#   red_meat: 1.5, # servings per day
#   processed_meat: 0.5, # servings per day
#   fats: 0.5, # servings per day
#   soda: 1, # drinks per day
#   alcohol: 1, # drinks per day
#   logdate: '2019-05-17'
#   )

# UserScore.create!(
#   user: user,
#   bmi: 28.5,
#   physical_activity: 0.3, # hours per day
#   fruits_vegetables: 2, # servings per day
#   whole_grains: 10, # grams per day
#   red_meat: 1.5, # servings per day
#   processed_meat: 0.5, # servings per day
#   fats: 0.5, # servings per day
#   soda: 1, # drinks per day
#   alcohol: 1, # drinks per day
#   logdate: '2019-05-18'
#   )

# UserScore.create!(
#   user: user,
#   bmi: 28.4,
#   physical_activity: 0.3, # hours per day
#   fruits_vegetables: 2, # servings per day
#   whole_grains: 10, # grams per day
#   red_meat: 1.5, # servings per day
#   processed_meat: 0.5, # servings per day
#   fats: 0.5, # servings per day
#   soda: 1, # drinks per day
#   alcohol: 1, # drinks per day
#   logdate: '2019-05-19'
#   )

# # CREATING GOOD DAYS

# UserScore.create!(
#   user: user,
#   bmi: 28.5,
#   physical_activity: 1, # hours per day
#   fruits_vegetables: 4, # servings per day
#   whole_grains: 15, # grams per day
#   red_meat: 0.5, # servings per day
#   processed_meat: 0, # servings per day
#   fats: 1, # servings per day
#   soda: 0, # drinks per day
#   alcohol: 0, # drinks per day
#   logdate: '2019-05-20'
#   )

# UserScore.create!(
#   user: user,
#   bmi: 28.4,
#   physical_activity: 1, # hours per day
#   fruits_vegetables: 4, # servings per day
#   whole_grains: 15, # grams per day
#   red_meat: 0.5, # servings per day
#   processed_meat: 0, # servings per day
#   fats: 1, # servings per day
#   soda: 0, # drinks per day
#   alcohol: 0, # drinks per day
#   logdate: '2019-05-21'
#   )

# UserScore.create!(
#   user: user,
#   bmi: 28.3,
#   physical_activity: 1, # hours per day
#   fruits_vegetables: 4, # servings per day
#   whole_grains: 15, # grams per day
#   red_meat: 0.5, # servings per day
#   processed_meat: 0, # servings per day
#   fats: 1, # servings per day
#   soda: 0, # drinks per day
#   alcohol: 0, # drinks per day
#   logdate: '2019-05-22'
#   )

# UserScore.create!(
#   user: user,
#   bmi: 28.2,
#   physical_activity: 1, # hours per day
#   fruits_vegetables: 4, # servings per day
#   whole_grains: 15, # grams per day
#   red_meat: 0.5, # servings per day
#   processed_meat: 0, # servings per day
#   fats: 1, # servings per day
#   soda: 0, # drinks per day
#   alcohol: 0, # drinks per day
#   logdate: '2019-05-23'
#   )

# UserScore.create!(
#   user: user,
#   bmi: 28.1,
#   physical_activity: 2, # hours per day
#   fruits_vegetables: 4, # servings per day
#   whole_grains: 15, # grams per day
#   red_meat: 0.5, # servings per day
#   processed_meat: 0, # servings per day
#   fats: 1, # servings per day
#   soda: 0, # drinks per day
#   alcohol: 0, # drinks per day
#   logdate: '2019-05-24'
#   )

# UserScore.create!(
#   user: user,
#   bmi: 28.0,
#   physical_activity: 1, # hours per day
#   fruits_vegetables: 4, # servings per day
#   whole_grains: 15, # grams per day
#   red_meat: 0.5, # servings per day
#   processed_meat: 2, # servings per day
#   fats: 1, # servings per day
#   soda: 0, # drinks per day
#   alcohol: 0, # drinks per day
#   logdate: '2019-05-25'
#   )

# UserScore.create!(
#   user: user,
#   bmi: 27.9,
#   physical_activity: 1, # hours per day
#   fruits_vegetables: 4, # servings per day
#   whole_grains: 15, # grams per day
#   red_meat: 0.5, # servings per day
#   processed_meat: 0, # servings per day
#   fats: 1, # servings per day
#   soda: 0, # drinks per day
#   alcohol: 0, # drinks per day
#   logdate: '2019-05-26'
#   )

# UserScore.create!(
#   user: user,
#   bmi: 27.8,
#   physical_activity: 1, # hours per day
#   fruits_vegetables: 4, # servings per day
#   whole_grains: 15, # grams per day
#   red_meat: 0.5, # servings per day
#   processed_meat: 0, # servings per day
#   fats: 1, # servings per day
#   soda: 0, # drinks per day
#   alcohol: 0, # drinks per day
#   logdate: '2019-05-27'
#   )

# UserScore.create!(
#   user: user,
#   bmi: 27.7,
#   physical_activity: 1, # hours per day
#   fruits_vegetables: 2, # servings per day
#   whole_grains: 8, # grams per day
#   red_meat: 0.5, # servings per day
#   processed_meat: 1, # servings per day
#   fats: 1, # servings per day
#   soda: 0, # drinks per day
#   alcohol: 0, # drinks per day
#   logdate: '2019-05-28'
#   )

# UserScore.create!(
#   user: user,
#   bmi: 27.7,
#   physical_activity: 1, # hours per day
#   fruits_vegetables: 3, # servings per day
#   whole_grains: 5, # grams per day
#   red_meat: 0.5, # servings per day
#   processed_meat: 1, # servings per day
#   fats: 1, # servings per day
#   soda: 0, # drinks per day
#   alcohol: 0, # drinks per day
#   logdate: '2019-05-29'
#   )

# UserScore.create!(
#   user: user,
#   bmi: 27.7,
#   physical_activity: 1, # hours per day
#   fruits_vegetables: 4, # servings per day
#   whole_grains: 15, # grams per day
#   red_meat: 0.5, # servings per day
#   processed_meat: 0, # servings per day
#   fats: 1, # servings per day
#   soda: 2, # drinks per day
#   alcohol: 2, # drinks per day
#   logdate: '2019-05-30'
#   )

# UserScore.create!(
#   user: user,
#   bmi: 27.7,
#   physical_activity: 0, # hours per day
#   fruits_vegetables: 3, # servings per day
#   whole_grains: 12, # grams per day
#   red_meat: 0.5, # servings per day
#   processed_meat: 0.5, # servings per day
#   fats: 0.8, # servings per day
#   soda: 1, # drinks per day
#   alcohol: 2, # drinks per day
#   logdate: '2019-05-31'
#   )


puts 'Done!'
