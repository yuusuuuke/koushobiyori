require "test_helper"

class Admin::ApiSearchesControllerTest < ActionDispatch::IntegrationTest
  test "should get search_result" do
    get admin_api_searches_search_result_url
    assert_response :success
  end
end
