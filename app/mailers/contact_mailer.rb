class ContactMailer < ApplicationMailer
  default from: "admin@joshuanassar.com"

  def contact_email(message)
    @message = message
    mail(to: "ufbcm@ufbcm.org", subject: "A student is interested in the BCM!")
  end
end
