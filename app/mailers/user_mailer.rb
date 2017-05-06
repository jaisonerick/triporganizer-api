class UserMailer < ApplicationMailer
  def welcome_email(user_id, password)
    @user = User.find(user_id)
    @password = password
    mail(to: @user.email, subject: 'Bem Vindo ao Trip Organizer')
  end
end
