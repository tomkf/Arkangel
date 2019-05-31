
puts 'Wiping database...'
UserScore.destroy_all
User.destroy_all


puts 'Creating users'

user = User.create!(email: 'gustaf@email.com', password: '123456', age: 50, smoker: 'never')


puts 'Adding user score...'

# Add score

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
