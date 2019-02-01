require 'test_helper'

class ProvidersControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get providers_controller_create_url
    assert_response :success
  end

  test "should get update" do
    get providers_controller_update_url
    assert_response :success
  end

  test "should get show" do
    get providers_controller_show_url
    assert_response :success
  end

  test "should get destroy" do
    get providers_controller_destroy_url
    assert_response :success
  end

end
