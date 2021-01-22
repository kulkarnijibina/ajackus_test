class Message < ApplicationRecord
	validates :first_name, :last_name, :message, :email, :phone, presence: true
	after_save :send_mail
	validate :validate_email
	def send_mail
		MessageMailer.send_message_email.deliver_later
	end

	def validate_email
	  unless email =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
	    self.errors.add(:email , "is not an email.")
	  end
	end
end
