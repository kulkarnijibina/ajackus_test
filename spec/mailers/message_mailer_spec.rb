require "rails_helper"

RSpec.describe Message, :type => :mailer do
  describe "Message" do

    before(:all) do
      params = { first_name: 'Ajack', last_name: 'Cus', message: 'Random message', phone: '91123456789', email: 'ajay12@yopmail.com' }
      @message = Message.create(params)
    end

    let(:mail) { MessageMailer.with(message_id: @message.id).send_message_email }

    it "renders the headers" do
      expect(mail.subject).to eq("You got a new message !")
      expect(mail.to).to eq(["info@ajackus.com"])
      expect(mail.from).to eq(["test@yopmail.com"])
    end
  end
end