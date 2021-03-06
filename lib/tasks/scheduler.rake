desc "This task is called by the Heroku scheduler add-on"
task :test_fakejob => :environment do
  FakeJob.perform_later
end

task :notify => :environment do
  Notification.create(message: "Jose, your heart rate is rising. Chill out!", user: User.where(email: "jose@email.com")[0])
  Notification.create(message: "Jose, your heart rate is rising. Chill out!", user: User.where(email: "gustaf@email.com")[0])
end

task :squat => :environment do
  #first_min = User.where(email: "jose@email.com")[0].fitbit_scores.order(:logdate).last.active_minutes + 2

  #last_min = User.where(email: "gustaf@email.com")[0].fitbit_scores.order(:logdate).last.active_minutes + 2

  # if User.where(email: "jose@email.com")[0].fitbit_scores.order(:logdate).last.present?
  #   first_score = User.where(email: "jose@email.com")[0].fitbit_scores.order(:logdate).last.health_score + 5
  #   User.where(email: "jose@email.com")[0].fitbit_scores.order(:logdate).last.update(notified_user: false, exercise_type: "squats", active_minutes: 31, health_score: first_score)
  # end

  if User.where(email: "gustaf@email.com")[0].fitbit_scores.order(:logdate).last.present?
    last_score = User.where(email: "gustaf@email.com")[0].fitbit_scores.order(:logdate).last.health_score + 5
    User.where(email: "gustaf@email.com")[0].fitbit_scores.order(:logdate).last.update(notified_user: false, exercise_type: "squats", active_minutes: 31, health_score: last_score)
  end
end


task :weekly_update => :environment do

if Date.today.wday == 6
  UserMailer.weekly_email
end
end
