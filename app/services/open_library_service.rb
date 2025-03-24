require 'net/http'
require 'json'

class OpenLibraryService
  BASE_URL = "https://openlibrary.org/api/books"

  def self.fetch_book_details(isbn)
    url = "#{BASE_URL}?bibkeys=ISBN:#{isbn}&format=json&jscmd=data"
    response = Net::HTTP.get(URI(url))
    data = JSON.parse(response)
    book_data = data["ISBN:#{isbn}"]

    return nil unless book_data

    {
      title: book_data["title"],
      author: book_data["authors"]&.first&.dig("name")
    }
  end
end
