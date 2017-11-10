require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get home_index_url
    assert_response :success
  end

  test "should get admin" do
    get home_admin_url
    assert_response :success
  end

  test "should get customer" do
    get home_customer_url
    assert_response :success
  end

  test "should get dealer" do
    get home_dealer_url
    assert_response :success
  end

  test "should get production" do
    get home_production_url
    assert_response :success
  end

  test "should get guest" do
    get home_guest_url
    assert_response :success
  end

end
