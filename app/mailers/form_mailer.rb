class FormMailer < ApplicationMailer

  default from: "jameson@aeroform.com"

  def form_email(data)
    @data = data
    puts('=======data in form_email======')
    puts(@data.to_yaml)
    mail(to: @data[:recipient], subject: "New form data!")
  end
end
