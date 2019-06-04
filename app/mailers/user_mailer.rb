class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome
    @user = params[:user] # Instance variable => available in view
    mail(to: @user.email, subject: 'Welcome to Le Wagon')
    # This will render a view in `app/views/user_mailer`!
  end



  def test_welcome
    @user = params[:user] # Instance variable => available in view
    mail(to: @user.email, subject: 'test email from rails')
  end


def weekly_update
 @user = params[:user] # Instance variable => available in view
    mail(to: @user.email, subject: 'test email from rails')
end

end
