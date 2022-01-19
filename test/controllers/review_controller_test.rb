require 'test_helper'

class ReviewControllerTest < ActionDispatch::IntegrationTest
  test "should get write" do
    get review_write_url
    assert_response :success
  end

end
