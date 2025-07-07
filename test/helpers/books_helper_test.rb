require "test_helper"

class BooksHelperTest < ActiveSupport::TestCase
    include BooksHelper
    test "title_format" do
        book = books(:one)
        assert_equal "Book 1 - Author 1",title_format(book)
    end

end