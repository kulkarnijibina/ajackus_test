require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @message = messages(:one)
  end

  test "should get index" do
    get messages_url
    assert_response :success
  end


  test "should create message" do
    assert_difference('Message.count') do
      post "#{messages_url}.js", params: { email: @message.email, first_name: @message.first_name, message: @message.message, phone: @message.phone, last_name: @message.last_name }
    end

    assert_response :ok
    assert_equal Message.last.message, @message.message
  end
end
