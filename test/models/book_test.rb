require "test_helper"

class BookTest < ActiveSupport::TestCase
  test "validation of book testing" do
    book = Book.new
    book.author = "Author"
    book.title = "Title"
    book.user = User.new
    book_user = users(:one)

    
    assert book.valid?
  end
end
