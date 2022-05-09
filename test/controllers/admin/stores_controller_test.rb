require "test_helper"

class Admin::StoresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_stores_index_url
    assert_response :success
  end
end
