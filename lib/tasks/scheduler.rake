desc "This task is called by the Heroku scheduler add-on"
task :test_fakejob => :environment do
  FakeJob.perform_later
end

task :notify => :environment do
  Notification.create(message: "Jose, your heart rate is rising. Chill out!")
end


task :weekly_update => :environment do

if Date.today.wday == 6
  UserMailer.weekly_email
end
end
