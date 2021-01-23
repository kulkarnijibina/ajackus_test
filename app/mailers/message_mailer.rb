class MessageMailer < ApplicationMailer
  def send_message_email
    @message = Message.find(params[:message_id])
    mail(to: "info@ajackus.com", subject: 'You got a new message !')
  end
end
