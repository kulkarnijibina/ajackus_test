require "rails_helper"
require 'spec_helper'

RSpec.describe Message , :type => :model do

  before(:all) do
    params = { first_name: 'Ajack', last_name: 'Cus', message: 'Random message', phone: '91123456789', email: 'ajay12@@yopmail.com' }
    @message = Message.new(params)
  end

  context 'validation' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:message) }
    it { should validate_presence_of(:phone) }
    it do 
      @message.valid?
      @message.errors.full_messages.should include("Email is not an email.")
    end
  end
end