require "test_helper"

class ReviewTest < ActiveSupport::TestCase
  test "validations for review testing" do
    review = Review.new
    review.content = "Content"
    review.rating = "4"
    review.user = User.new
    review.book = Book.new

    assert review.valid?
  end
end
