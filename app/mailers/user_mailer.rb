class UserMailer < ApplicationMailer

  def registration_confirmation(user)
    @user = user
    mail(to: @user.email, subject: "Please confirm your email address")
  end

end
