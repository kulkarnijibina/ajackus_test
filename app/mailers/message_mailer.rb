class MessageMailer < ApplicationMailer
	def send_message_email
	  mail(to: "info@ajackus.com", subject: 'You got a new message !')
	end
end
