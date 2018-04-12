require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get feed" do
    get static_pages_feed_url
    assert_response :success
  end

end
