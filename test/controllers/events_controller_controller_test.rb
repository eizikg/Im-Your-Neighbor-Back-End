require 'test_helper'

class EventsControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get events_controller_create_url
    assert_response :success
  end

  test "should get update" do
    get events_controller_update_url
    assert_response :success
  end

  test "should get show" do
    get events_controller_show_url
    assert_response :success
  end

  test "should get destroy" do
    get events_controller_destroy_url
    assert_response :success
  end

end
