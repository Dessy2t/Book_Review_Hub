require "application_system_test_case"

class HomesTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers
  setup do
    sign_in users(:one)
  end

  test "default books page" do
    visit root_url
    assert_content "Book 1"

  end

  test "logged_in books page to edit a book" do
    visit root_url

    click_on "Edit"
    fill_in "Title", with: "title edited"
    fill_in "Author", with: "author"
    fill_in "Isbn", with: 214423523
 
    click_on "Update Book"
    assert_content "title edited"
  end
  
  test "logged in books page to delete a book" do
    visit root_url

    assert_text "Book 1"
    accept_confirm do
      click_on "Delete"
    end

    assert_no_text "Book 1"
  end
end

