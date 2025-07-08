require "application_system_test_case"

class BooksTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers
  setup do
    sign_in users(:one)
  end

  test "adding a book" do
    visit root_url
    click_on "Add Book"

    assert_selector "h1", text: "New Book"
    fill_in "Title", with: "my new book"
    fill_in "Author", with: "User 1"
    fill_in "Isbn", with: "12456321"
    click_on "Create Book"

    assert_content "my new book"
  end  
end
 




