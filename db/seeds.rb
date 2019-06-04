puts 'Wiping database...'
UserScore.destroy_all
FitbitScore.destroy_all
User.destroy_all

puts 'Creating users'

user = User.create!(email: 'gustaf@email.com', first_name: "wolfgang", last_name: "mozart", password: '123456', age: 38, smoker: 'never')

puts 'Adding user score...'

# Add score

exercise_array = ["jogging", "brisk walk", "swimming", "weights", "biking", "basketball", "boxing", "running" ]

i = 1

FitbitScore.create!(user: user,
  bmi: 31,
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
  overall_sleep: rand(280..350),
  awaken_sleep: 35,
  rem_sleep: 50,
  light_sleep: 15,
  deep_sleep: 28,
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
  overall_sleep: rand(280..350),
  awaken_sleep: 35,
  rem_sleep: 50,
  light_sleep: 15,
  deep_sleep: 28,
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

puts 'Done!'
