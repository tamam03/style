require "test_helper"

class Public::RoomsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_rooms_index_url
    assert_response :success
  end
end
