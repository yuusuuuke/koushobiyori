require "test_helper"

class Public::ApiSearchesControllerTest < ActionDispatch::IntegrationTest
  test "should get search_result" do
    get public_api_searches_search_result_url
    assert_response :success
  end
end
