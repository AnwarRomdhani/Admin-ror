require "test_helper"

class SupportticketsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get supporttickets_index_url
    assert_response :success
  end

  test "should get show" do
    get supporttickets_show_url
    assert_response :success
  end

  test "should get new" do
    get supporttickets_new_url
    assert_response :success
  end

  test "should get create" do
    get supporttickets_create_url
    assert_response :success
  end
end
