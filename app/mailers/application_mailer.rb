class ApplicationMailer < ActionMailer::Base
  #default from: 'from@example.com'
  default from: ENV['mail_gun_username']
  layout 'mailer'
end
