class NotificationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification_mailer.notify_user.subject
  #
  def notify_user(greeting_card)
    @greeting_card = greeting_card

    mail to: "sarmadserioussam@gmail.com", subject: "Greeting Card Received"
  end
end
