class UserMailer < ActionMailer::Base
  default from: "Logan Yu <yu.logan@gmail.com>"

  def welcome_email(user)
    @user = user
    @url  = 'http://runblr.us/login'
    mail(to: user.email, subject: 'Welcome to Runblr!', bcc: 'yu.logan@gmail.com')

  end

  def password_reset(user)
    @user = user
    mail(to: user.email, subject: 'Password reset request')
  end


end
