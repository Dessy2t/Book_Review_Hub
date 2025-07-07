module BooksHelper
    def title_format(book)
        "#{book.title} - #{book.author}"
    end
end
