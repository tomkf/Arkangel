
puts 'Wiping database...'
UserScore.destroy_all
User.destroy_all


puts 'Creating users'

user = User.create!(email: 'gustaf@email.com', password: '123456', age: 25, smoker: 'never')


puts 'Adding user score...'

# Add score
score1 = UserScore.create(
  user: user,
  bmi: 18,
  physical_activity: 0.5, # hours per day
  fruits_vegetables: 2, # servings per day
  whole_grains: 15, # grams per day
  red_meat: 0.5, # servings per day
  processed_meat: 0.5, # servings per day
  fats: 1, # servings per day
  soda: 0, # drinks per day
  alcohol: 0, # drinks per day
  logdate: '2019-05-25'
  )
  # Calculate algo score
score1.algorithm
  # Save score
score1.save

score2 = UserScore.create(
  user: user,
  bmi: 40,
  physical_activity: 0, # hours per day
  fruits_vegetables: 1, # servings per day
  whole_grains: 5, # grams per day
  red_meat: 10, # servings per day
  processed_meat: 12, # servings per day
  fats: 0, # servings per day
  soda: 12, # drinks per day
  alcohol: 14, # drinks per day
  logdate: '2019-05-26'
  )
score2.algorithm
score2.save

# UserScore.create(
#   user: user,
#   bmi: 24,
#   physical_activity: 3.5, # hours per week
#   fruits_vegetables: 4, # servings per day
#   whole_grains: 15, # grams per day
#   red_meat: 0.5, # servings per day
#   processed_meat: 1, # servings per day
#   fats: 1, # servings per day
#   soda: 0, # drinks per day
#   alcohol: 1, # drinks per day
#   logdate: '2019-05-27'
#   )

# UserScore.create(
#   user: user,
#   bmi: 24,
#   physical_activity: 3.5, # hours per week
#   fruits_vegetables: 4, # servings per day
#   whole_grains: 15, # grams per day
#   red_meat: 0.5, # servings per day
#   processed_meat: 1, # servings per day
#   fats: 1, # servings per day
#   soda: 0, # drinks per day
#   alcohol: 1, # drinks per day
#   logdate: '2019-05-28'
#   )






puts 'Done!'
