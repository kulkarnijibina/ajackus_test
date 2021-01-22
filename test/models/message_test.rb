require 'test_helper'

class MessageTest < ActiveSupport::TestCase
	setup do
	  @message = messages(:one)
	end
  test "should not save a message" do
    article = Message.new
    assert_not article.save
  end

  test "should save a message" do
    article = Message.new(@message.attributes.symbolize_keys.except(:id))
    assert article.save
  end

  test "should report error" do
    # some_undefined_variable is not defined elsewhere in the test case
    assert_raises(NameError) do
      some_undefined_variable
    end
  end
end
