class UserMailer < ApplicationMailer
  def welcome_email(user, password)
    @user = @user
    @password = @password
    mail(to: @user.email, subject: 'Bem Vindo ao Trip Organizer')
  end
end
