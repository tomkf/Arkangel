# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/welcome
  def welcome
<<<<<<< HEAD
    user = User.first
    # This is how you pass value to params[:user] inside mailer definition!
    UserMailer.with(user: user).welcome
=======
    UserMailer.welcome
>>>>>>> 0a142411c38cc33d171cc3d865796e6555192400
  end

end
