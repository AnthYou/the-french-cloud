class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome
    @user = params[:user] # Instance variable => available in view
    mail(to: @user.email, subject: 'Your subscription to the French Cloud!')
    # This will render a view in `app/views/user_mailer`!
  end

  def new_user
    @user = params[:user] # Instance variable => available in view
    mail(to: @user.email, subject: 'Welcome to the French Cloud!')
    # This will render a view in `app/views/user_mailer`!
  end
end
