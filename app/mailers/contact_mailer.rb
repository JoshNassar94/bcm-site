class ContactMailer < ApplicationMailer
  default from: "admin@joshuanassar.com"

  def contact_email(message)
    @message = message
    mail(to: "joshnassar94@gmail.com", subject: "A student is interested in the BCM!")
  end
end
