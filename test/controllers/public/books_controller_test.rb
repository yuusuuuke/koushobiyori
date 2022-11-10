require "test_helper"

class Public::BooksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_books_index_url
    assert_response :success
  end

  test "should get show" do
    get public_books_show_url
    assert_response :success
  end

  test "should get search" do
    get public_books_search_url
    assert_response :success
  end

  test "should get search_api" do
    get public_books_search_api_url
    assert_response :success
  end
end
