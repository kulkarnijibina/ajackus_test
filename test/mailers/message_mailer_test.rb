require 'test_helper'

class MessageMailerTest < ActionMailer::TestCase
  def test_send_message_email
	  assert_emails 0
	  MessageMailer.send_message_email.deliver_now
	  assert_emails 1
	  MessageMailer.send_message_email.deliver_now
	  assert_emails 2
    email = MessageMailer.send_message_email
    assert_emails 1 do
      email.deliver_later
    end

    assert_equal email.to, ["info@ajackus.com"]
    assert_equal email.from, ['test@yopmail.com']
    assert_equal email.subject, 'You got a new message !'
  end

end
