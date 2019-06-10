#if there is great discrepancies with health scores, look into the
#sleep values first and work with those....might be problematic the way
#they are currently

puts 'Wiping database...'
UserScore.destroy_all
Notification.destroy_all
FitbitScore.destroy_all
UserParam.destroy_all
User.destroy_all

puts 'Creating users'

user2 = User.create!(email: 'jose@email.com', first_name: "jose", last_name: "jose", password: '123456', dob: "1990-02-02", smoker: 'never')
UserParam.create!(bmi: 26, weight: 86, height: 180, user: user2 )

user = User.create!(email: 'gustaf@email.com', first_name: "jose", last_name: "mozart", password: '123456', dob: "1990-02-02", smoker: 'never')

puts 'Adding user score...'

# Add score

exercise_array = ["jogging", "brisk walk", "swimming", "weights", "biking", "basketball", "boxing", "running" ]

i = 1

score = FitbitScore.create!(user: user,
<<<<<<< HEAD
  bmi: 31,
  overall_sleep: rand(320..450),
  awaken_sleep: rand(25..35),
  rem_sleep: rand(40..55),
  light_sleep: rand(15..25),
  deep_sleep: rand(24..30),
  heart_rate: rand(70..110),
  steps: 8000,
  active_minutes: rand(5..25),
  exercise_type: exercise_array[rand(0..3)],
  floors: 5,
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
=======
  bmi: 36,
    overall_sleep: 482,
   awaken_sleep: 25,
  rem_sleep: 154,
  light_sleep: 202,
  deep_sleep: 77,
  heart_rate: 65,
  steps: 8000,
  active_minutes: 20,
  exercise_type: exercise_array[rand(0..3)],
  floors: 5,
  exercise_time: 18,
  exercise_km: 4,
  exercise_cal: 2600,
  water: 2600,
  carbs: 150,
  fat: 80,
  fiber: 30,
  protein: 45,
  sodium: 5,
  sugar: 45,
  cholesterol: 16,
  diet_cal: 2400,
  alcohol_ml: 45,
>>>>>>> 8cbd268a28a426e9db7d8c8c45fc20873c813070
  logdate: '2019-05-01')
score.algorithm_v2


<<<<<<< HEAD
15.times do
 score = FitbitScore.create!(user: user,
   bmi: 29,
   overall_sleep: rand(320..450),
   awaken_sleep: rand(25..35),
  rem_sleep: rand(40..55),
  light_sleep: rand(15..25),
  deep_sleep: rand(24..30),
   heart_rate: rand(65..105),
  steps: 8000,
   active_minutes: rand(10..30),
   exercise_type: exercise_array[rand(0..5)],
  floors: 5,
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
=======
10.times do
 score = FitbitScore.create!(user: user,
   bmi: 28,
    overall_sleep: 482,
   awaken_sleep: 25,
  rem_sleep: 154,
  light_sleep: 202,
  deep_sleep: 77,
  heart_rate: 65,
  steps: 8000,
  active_minutes: 20,
  exercise_type: exercise_array[rand(0..3)],
  floors: 5,
  exercise_time: 18,
  exercise_km: 4,
  exercise_cal: 2600,
  water: rand(2400..2700),
  carbs: 150,
  fat: 80,
  fiber: 30,
  protein: 45,
  sodium: 5,
  sugar: 45,
  cholesterol: 16,
  diet_cal: 2400,
  alcohol_ml: 45,
  logdate: Date.new(2019, 5, 15) + i)
>>>>>>> 8cbd268a28a426e9db7d8c8c45fc20873c813070
 i += 1
 score.algorithm_v2
end


<<<<<<< HEAD
8.times do
=======
5.times do
>>>>>>> 8cbd268a28a426e9db7d8c8c45fc20873c813070
score = FitbitScore.create!(user: user,
  bmi: 28,
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
  logdate: Date.new(2019, 5, 15) + i)
 i += 1
 score.algorithm_v2
end

<<<<<<< HEAD
9.times do
=======
8.times do
>>>>>>> 8cbd268a28a426e9db7d8c8c45fc20873c813070
 score = FitbitScore.create!(user: user,
   bmi: 31,
   overall_sleep: rand(320..450),
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
<<<<<<< HEAD
   logdate: Date.new(2019, 5, 1) + i)
=======
   logdate: Date.new(2019, 5, 15) + i)
>>>>>>> 8cbd268a28a426e9db7d8c8c45fc20873c813070
 i += 1
 score.algorithm_v2
 end



puts 'Done!'
