require "application_system_test_case"

class ReviewsTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers
  setup do
    sign_in users(:one)
  end

  test "user can access books added" do
    visit root_url
    assert_content "Book 1"
  end

  test "adding a review to a book" do
    visit root_url
    click_on "Book 1"

    assert_selector "trix-editor"
    find("trix-editor").click.set("nice read")
    assert_selector ".star-rating"
    find('label[for=star3]').click
    # choose "★★★"
    click_on "Submit Review"

    assert_text "nice read"
    assert_text "★★★☆☆"
  end


  test "deleting a book's review" do
    visit root_url
    click_on "Book 1"

    assert_selector "trix-editor"
    find("trix-editor").click.set("nice read")
    assert_selector ".star-rating"
    find('label[for=star3]').click
    click_on "Submit Review"

    assert_text "nice read"
    within find("li", text: "nice read") do
      accept_confirm do
       click_on "Delete"
      end
    end
    
    assert_no_text "nice read"
  end
end
