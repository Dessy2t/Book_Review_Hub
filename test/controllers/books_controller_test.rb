require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  test "should get index" do
    get books_url
    assert_response :success
  end

  test "display books when searched" do
    get books_url, params: { commit: "Search" }
    assert_response :accepted
  end

  test "should get show" do
    book = books(:one)
    sign_in users(:one)
    get book_url(id: book.id)
    assert_response :success
  end

  test "should get new" do
    sign_in users(:one)
    get new_book_url
    assert_response :success
  end

  test "book successfully created" do
    new_params = {
      book: {
        author: "Author",
        title: "Title"
      }
    }
    sign_in users(:one)
    post books_url(params: new_params)
    assert_redirected_to book_url(Book.last)
  end

  test "book unsuccessfully created" do
    new_params = {
      book: {
        author: "Author"
      }
    }
    sign_in users(:one)
    post books_url(params: new_params)
    assert_response :unprocessable_entity
  end

  test "should get edit" do
    sign_in users(:one)
    book = books(:one)
    get edit_book_url(book)
    assert_response :success
  end

  test "book successfully updated" do
    update_params = {
      book: {
        title: "Updated Title",
        author: "Updated Author"
      }
    }
    sign_in users(:one)
    patch book_url(books(:one)), params: update_params
    assert_redirected_to book_url(books(:one))
  end

  test "should get destroy" do
    sign_in users(:one)
    delete book_url(books(:one))
    assert_redirected_to books_url 
  end
end
