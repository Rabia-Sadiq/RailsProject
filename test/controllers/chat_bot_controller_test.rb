require "test_helper"

class ChatBotControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get chat_bot_show_url
    assert_response :success
  end

  test "should get create" do
    get chat_bot_create_url
    assert_response :success
  end
end
