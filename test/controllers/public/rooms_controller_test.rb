require "test_helper"

class Public::RoomsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get public_rooms_create_url
    assert_response :success
  end

  test "should get index" do
    get public_rooms_index_url
    assert_response :success
  end

  test "should get show" do
    get public_rooms_show_url
    assert_response :success
  end
end
