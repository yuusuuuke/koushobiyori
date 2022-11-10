require "test_helper"

class Admin::BooksControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get admin_books_search_url
    assert_response :success
  end

  test "should get search_api" do
    get admin_books_search_api_url
    assert_response :success
  end

  test "should get show" do
    get admin_books_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_books_edit_url
    assert_response :success
  end
end
