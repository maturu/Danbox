require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get introduction" do
    get static_pages_introduction_url
    assert_response :success
  end

  test "should get auction" do
    get static_pages_auction_url
    assert_response :success
  end

  test "should get event" do
    get static_pages_event_url
    assert_response :success
  end

end
