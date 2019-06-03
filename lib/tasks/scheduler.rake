desc "This task is called by the Heroku scheduler add-on"
task :test_fakejob => :environment do
  FakeJob.perform_later
end
