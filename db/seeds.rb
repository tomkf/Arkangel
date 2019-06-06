#if there is great discrepancies with health scores, look into the
#sleep values first and work with those....might be problematic the way
#they are currently

puts 'Wiping database...'
UserScore.destroy_all
FitbitScore.destroy_all
User.destroy_all

puts 'Creating users'

user = User.create!(email: 'gustaf@email.com', first_name: "wolfgang", last_name: "mozart", password: '123456', dob: "1990-02-02", smoker: 'never')

puts 'Adding user score...'

# Add score

exercise_array = ["jogging", "brisk walk", "swimming", "weights", "biking", "basketball", "boxing", "running" ]

i = 1

FitbitScore.create!(user: user,
  bmi: 31,
  overall_sleep: rand(280..350),
  awaken_sleep: rand(25..35),
  rem_sleep: rand(40..55),
  light_sleep: rand(15..25),
  deep_sleep: rand(24..30),
  heart_rate: rand(70..110),
  steps: rand(3500..8000),
  active_minutes: rand(5..25),
  exercise_type: exercise_array[rand(0..3)],
  floors: rand(0..5),
  exercise_time: rand(5..25),
  exercise_km: rand(0..6),
  exercise_cal: rand(1000..2600),
  water: rand(1800..2800),
  carbs: rand(80..360),
  fat: rand(80..150),
  fiber: rand(15..30),
  protein: rand(20..50),
  sodium: rand(5..10),
  sugar: rand(60..140),
  cholesterol: rand(25..39),
  diet_cal: rand(2400..3500),
  alcohol_ml: rand(50..140),
  logdate: '2019-05-01')

 9.times do
 FitbitScore.create!(user: user,
   bmi: 31,
   overall_sleep: rand(280..350),
   awaken_sleep: rand(25..35),
  rem_sleep: rand(40..55),
  light_sleep: rand(15..25),
  deep_sleep: rand(24..30),
   heart_rate: rand(70..110),
   steps: rand(3500..8000),
   active_minutes: rand(5..25),
   exercise_type: exercise_array[rand(0..3)],
   floors: rand(0..5),
   exercise_time: rand(5..25),
   exercise_km: rand(0..6),
   exercise_cal: rand(1000..2600),
   water: rand(1800..2800),
   carbs: rand(80..360),
   fat: rand(80..150),
   fiber: rand(15..30),
   protein: rand(20..50),
   sodium: rand(5..10),
   sugar: rand(60..140),
   cholesterol: rand(25..39),
   diet_cal: rand(2400..3500),
   alcohol_ml: rand(50..140),
   logdate: Date.new(2019, 5, 1) + i)
 i += 1
 end

 15.times do
 FitbitScore.create!(user: user,
   bmi: 29,
   overall_sleep: rand(320..450),
   awaken_sleep: rand(25..35),
  rem_sleep: rand(40..55),
  light_sleep: rand(15..25),
  deep_sleep: rand(24..30),
   heart_rate: rand(65..105),
   steps: rand(5500..9999),
   active_minutes: rand(10..30),
   exercise_type: exercise_array[rand(0..5)],
   floors: rand(2..4),
   exercise_time: rand(8..25),
   exercise_km: rand(1..8),
   exercise_cal: rand(1900..2800),
   water: rand(2000..3800),
   carbs: rand(80..250),
   fat: rand(80..150),
   fiber: rand(15..30),
   protein: rand(25..50),
   sodium: rand(3..10),
   sugar: rand(30..120),
   cholesterol: rand(15..35),
   diet_cal: rand(2300..3300),
   alcohol_ml: rand(45..100),
   logdate: Date.new(2019, 5, 1) + i)
 i += 1
end

8.times do
 FitbitScore.create!(user: user,
  bmi: 26,
  overall_sleep: rand(350..480),
  awaken_sleep: rand(25..35),
  rem_sleep: rand(40..55),
  light_sleep: rand(15..25),
  deep_sleep: rand(24..30),
  heart_rate: rand(65..85),
  steps: rand(650..1200),
  active_minutes: rand(16..38),
  exercise_type: exercise_array[rand(0..7)],
  floors: rand(2..7),
  exercise_time: rand(15..35),
  exercise_km: rand(3..10),
  exercise_cal: rand(1900..3100),
  water: rand(2000..3800),
  carbs: rand(80..330),
  fat: rand(75..120),
  fiber: rand(22..45),
  protein: rand(30..57),
  sodium: rand(1..10),
  sugar: rand(25..95),
  cholesterol: rand(8..33),
  diet_cal: rand(2000..2800),
  alcohol_ml: rand(30..90),
  logdate: Date.new(2019, 5, 1) + i)
 i += 1
end

############################
##user-score data##########
############################################################################################
###########################################################################################

# BAD AND SEMI BAD DAYS
UserScore.create!(
  user: user,
  bmi: 30,
  physical_activity: 0, # hours per day
  fruits_vegetables: 0, # servings per day
  whole_grains: 5, # grams per day
  red_meat: 2, # servings per day
  processed_meat: 2, # servings per day
  fats: 0, # servings per day
  soda: 5, # drinks per day
  alcohol: 5, # drinks per day
  logdate: '2019-05-01'
  )

UserScore.create!(
  user: user,
  bmi: 29.5,
  physical_activity: 0, # hours per day
  fruits_vegetables: 1, # servings per day
  whole_grains: 5, # grams per day
  red_meat: 2, # servings per day
  processed_meat: 2, # servings per day
  fats: 0, # servings per day
  soda: 5, # drinks per day
  alcohol: 5, # drinks per day
  logdate: '2019-05-02'
  )
UserScore.create!(
  user: user,
  bmi: 30,
  physical_activity: 0.1, # hours per day
  fruits_vegetables: 0, # servings per day
  whole_grains: 5, # grams per day
  red_meat: 2, # servings per day
  processed_meat: 1, # servings per day
  fats: 0.2, # servings per day
  soda: 3, # drinks per day
  alcohol: 3, # drinks per day
  logdate: '2019-05-03'
  )
UserScore.create!(
  user: user,
  bmi: 29.3,
  physical_activity: 0.1, # hours per day
  fruits_vegetables: 0, # servings per day
  whole_grains: 5, # grams per day
  red_meat: 2, # servings per day
  processed_meat: 1, # servings per day
  fats: 0.3, # servings per day
  soda: 3, # drinks per day
  alcohol: 3, # drinks per day
  logdate: '2019-05-04'
  )

UserScore.create!(
  user: user,
  bmi: 29.3,
  physical_activity: 0.2, # hours per day
  fruits_vegetables: 0, # servings per day
  whole_grains: 5, # grams per day
  red_meat: 2, # servings per day
  processed_meat: 1, # servings per day
  fats: 0.3, # servings per day
  soda: 3, # drinks per day
  alcohol: 3, # drinks per day
  logdate: '2019-05-05'
  )
UserScore.create!(
  user: user,
  bmi: 29,
  physical_activity: 0.3, # hours per day
  fruits_vegetables: 0, # servings per day
  whole_grains: 5, # grams per day
  red_meat: 2, # servings per day
  processed_meat: 1, # servings per day
  fats: 0.3, # servings per day
  soda: 3, # drinks per day
  alcohol: 3, # drinks per day
  logdate: '2019-05-06'
  )
UserScore.create!(
  user: user,
  bmi: 29,
  physical_activity: 0.3, # hours per day
  fruits_vegetables: 0, # servings per day
  whole_grains: 5, # grams per day
  red_meat: 2, # servings per day
  processed_meat: 1, # servings per day
  fats: 0.3, # servings per day
  soda: 3, # drinks per day
  alcohol: 3, # drinks per day
  logdate: '2019-05-07'
  )
UserScore.create!(
  user: user,
  bmi: 29,
  physical_activity: 0.3, # hours per day
  fruits_vegetables: 0, # servings per day
  whole_grains: 5, # grams per day
  red_meat: 2, # servings per day
  processed_meat: 1, # servings per day
  fats: 0.3, # servings per day
  soda: 3, # drinks per day
  alcohol: 3, # drinks per day
  logdate: '2019-05-08'
  )
UserScore.create!(
  user: user,
  bmi: 29,
  physical_activity: 0.3, # hours per day
  fruits_vegetables: 0, # servings per day
  whole_grains: 5, # grams per day
  red_meat: 2, # servings per day
  processed_meat: 1, # servings per day
  fats: 0.3, # servings per day
  soda: 3, # drinks per day
  alcohol: 1, # drinks per day
  logdate: '2019-05-09'
  )
UserScore.create!(
  user: user,
  bmi: 29,
  physical_activity: 0.4, # hours per day
  fruits_vegetables: 0, # servings per day
  whole_grains: 5, # grams per day
  red_meat: 2, # servings per day
  processed_meat: 1, # servings per day
  fats: 0.3, # servings per day
  soda: 2, # drinks per day
  alcohol: 2, # drinks per day
  logdate: '2019-05-10'
  )

# NEUTRAL DAYS
UserScore.create!(
  user: user,
  bmi: 29,
  physical_activity: 0.3, # hours per day
  fruits_vegetables: 2, # servings per day
  whole_grains: 10, # grams per day
  red_meat: 1.5, # servings per day
  processed_meat: 0.5, # servings per day
  fats: 0.5, # servings per day
  soda: 1, # drinks per day
  alcohol: 1, # drinks per day
  logdate: '2019-05-11'
  )

UserScore.create!(
  user: user,
  bmi: 28.9,
  physical_activity: 0.3, # hours per day
  fruits_vegetables: 2, # servings per day
  whole_grains: 10, # grams per day
  red_meat: 1.5, # servings per day
  processed_meat: 0.5, # servings per day
  fats: 0.5, # servings per day
  soda: 1, # drinks per day
  alcohol: 1, # drinks per day
  logdate: '2019-05-12'
  )

UserScore.create!(
  user: user,
  bmi: 28.7,
  physical_activity: 0.3, # hours per day
  fruits_vegetables: 2, # servings per day
  whole_grains: 10, # grams per day
  red_meat: 1.5, # servings per day
  processed_meat: 0.5, # servings per day
  fats: 0.5, # servings per day
  soda: 1, # drinks per day
  alcohol: 1, # drinks per day
  logdate: '2019-05-13'
  )

UserScore.create!(
  user: user,
  bmi: 28.6,
  physical_activity: 0.3, # hours per day
  fruits_vegetables: 2, # servings per day
  whole_grains: 10, # grams per day
  red_meat: 1.5, # servings per day
  processed_meat: 0.5, # servings per day
  fats: 0.5, # servings per day
  soda: 1, # drinks per day
  alcohol: 1, # drinks per day
  logdate: '2019-05-14'
  )

UserScore.create!(
  user: user,
  bmi: 28.5,
  physical_activity: 0.3, # hours per day
  fruits_vegetables: 2, # servings per day
  whole_grains: 10, # grams per day
  red_meat: 1.5, # servings per day
  processed_meat: 0.5, # servings per day
  fats: 0.5, # servings per day
  soda: 1, # drinks per day
  alcohol: 1, # drinks per day
  logdate: '2019-05-15'
  )

UserScore.create!(
  user: user,
  bmi: 28.9,
  physical_activity: 0.3, # hours per day
  fruits_vegetables: 2, # servings per day
  whole_grains: 10, # grams per day
  red_meat: 1.5, # servings per day
  processed_meat: 0.5, # servings per day
  fats: 0.5, # servings per day
  soda: 1, # drinks per day
  alcohol: 1, # drinks per day
  logdate: '2019-05-16'
  )

UserScore.create!(
  user: user,
  bmi: 28.6,
  physical_activity: 0.3, # hours per day
  fruits_vegetables: 2, # servings per day
  whole_grains: 10, # grams per day
  red_meat: 1.5, # servings per day
  processed_meat: 0.5, # servings per day
  fats: 0.5, # servings per day
  soda: 1, # drinks per day
  alcohol: 1, # drinks per day
  logdate: '2019-05-17'
  )

UserScore.create!(
  user: user,
  bmi: 28.5,
  physical_activity: 0.3, # hours per day
  fruits_vegetables: 2, # servings per day
  whole_grains: 10, # grams per day
  red_meat: 1.5, # servings per day
  processed_meat: 0.5, # servings per day
  fats: 0.5, # servings per day
  soda: 1, # drinks per day
  alcohol: 1, # drinks per day
  logdate: '2019-05-18'
  )

UserScore.create!(
  user: user,
  bmi: 28.4,
  physical_activity: 0.3, # hours per day
  fruits_vegetables: 2, # servings per day
  whole_grains: 10, # grams per day
  red_meat: 1.5, # servings per day
  processed_meat: 0.5, # servings per day
  fats: 0.5, # servings per day
  soda: 1, # drinks per day
  alcohol: 1, # drinks per day
  logdate: '2019-05-19'
  )

# CREATING GOOD DAYS

UserScore.create!(
  user: user,
  bmi: 28.5,
  physical_activity: 1, # hours per day
  fruits_vegetables: 4, # servings per day
  whole_grains: 15, # grams per day
  red_meat: 0.5, # servings per day
  processed_meat: 0, # servings per day
  fats: 1, # servings per day
  soda: 0, # drinks per day
  alcohol: 0, # drinks per day
  logdate: '2019-05-20'
  )

UserScore.create!(
  user: user,
  bmi: 28.4,
  physical_activity: 1, # hours per day
  fruits_vegetables: 4, # servings per day
  whole_grains: 15, # grams per day
  red_meat: 0.5, # servings per day
  processed_meat: 0, # servings per day
  fats: 1, # servings per day
  soda: 0, # drinks per day
  alcohol: 0, # drinks per day
  logdate: '2019-05-21'
  )

UserScore.create!(
  user: user,
  bmi: 28.3,
  physical_activity: 1, # hours per day
  fruits_vegetables: 4, # servings per day
  whole_grains: 15, # grams per day
  red_meat: 0.5, # servings per day
  processed_meat: 0, # servings per day
  fats: 1, # servings per day
  soda: 0, # drinks per day
  alcohol: 0, # drinks per day
  logdate: '2019-05-22'
  )

UserScore.create!(
  user: user,
  bmi: 28.2,
  physical_activity: 1, # hours per day
  fruits_vegetables: 4, # servings per day
  whole_grains: 15, # grams per day
  red_meat: 0.5, # servings per day
  processed_meat: 0, # servings per day
  fats: 1, # servings per day
  soda: 0, # drinks per day
  alcohol: 0, # drinks per day
  logdate: '2019-05-23'
  )

UserScore.create!(
  user: user,
  bmi: 28.1,
  physical_activity: 2, # hours per day
  fruits_vegetables: 4, # servings per day
  whole_grains: 15, # grams per day
  red_meat: 0.5, # servings per day
  processed_meat: 0, # servings per day
  fats: 1, # servings per day
  soda: 0, # drinks per day
  alcohol: 0, # drinks per day
  logdate: '2019-05-24'
  )

UserScore.create!(
  user: user,
  bmi: 28.0,
  physical_activity: 1, # hours per day
  fruits_vegetables: 4, # servings per day
  whole_grains: 15, # grams per day
  red_meat: 0.5, # servings per day
  processed_meat: 2, # servings per day
  fats: 1, # servings per day
  soda: 0, # drinks per day
  alcohol: 0, # drinks per day
  logdate: '2019-05-25'
  )

UserScore.create!(
  user: user,
  bmi: 27.9,
  physical_activity: 1, # hours per day
  fruits_vegetables: 4, # servings per day
  whole_grains: 15, # grams per day
  red_meat: 0.5, # servings per day
  processed_meat: 0, # servings per day
  fats: 1, # servings per day
  soda: 0, # drinks per day
  alcohol: 0, # drinks per day
  logdate: '2019-05-26'
  )

UserScore.create!(
  user: user,
  bmi: 27.8,
  physical_activity: 1, # hours per day
  fruits_vegetables: 4, # servings per day
  whole_grains: 15, # grams per day
  red_meat: 0.5, # servings per day
  processed_meat: 0, # servings per day
  fats: 1, # servings per day
  soda: 0, # drinks per day
  alcohol: 0, # drinks per day
  logdate: '2019-05-27'
  )

UserScore.create!(
  user: user,
  bmi: 27.7,
  physical_activity: 1, # hours per day
  fruits_vegetables: 2, # servings per day
  whole_grains: 8, # grams per day
  red_meat: 0.5, # servings per day
  processed_meat: 1, # servings per day
  fats: 1, # servings per day
  soda: 0, # drinks per day
  alcohol: 0, # drinks per day
  logdate: '2019-05-28'
  )

UserScore.create!(
  user: user,
  bmi: 27.7,
  physical_activity: 1, # hours per day
  fruits_vegetables: 3, # servings per day
  whole_grains: 5, # grams per day
  red_meat: 0.5, # servings per day
  processed_meat: 1, # servings per day
  fats: 1, # servings per day
  soda: 0, # drinks per day
  alcohol: 0, # drinks per day
  logdate: '2019-05-29'
  )

UserScore.create!(
  user: user,
  bmi: 27.7,
  physical_activity: 1, # hours per day
  fruits_vegetables: 4, # servings per day
  whole_grains: 15, # grams per day
  red_meat: 0.5, # servings per day
  processed_meat: 0, # servings per day
  fats: 1, # servings per day
  soda: 2, # drinks per day
  alcohol: 2, # drinks per day
  logdate: '2019-05-30'
  )

UserScore.create!(
  user: user,
  bmi: 27.7,
  physical_activity: 0, # hours per day
  fruits_vegetables: 3, # servings per day
  whole_grains: 12, # grams per day
  red_meat: 0.5, # servings per day
  processed_meat: 0.5, # servings per day
  fats: 0.8, # servings per day
  soda: 1, # drinks per day
  alcohol: 2, # drinks per day
  logdate: '2019-05-31'
  )

puts 'Done!'
