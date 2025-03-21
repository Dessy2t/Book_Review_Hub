require 'net/http'
require 'json'

class Book < ApplicationRecord

  def self.find_by_isbn(isbn)
    url = "https://openlibrary.org/api/books?bibkeys=ISBN:#{isbn}&format=json&jscmd=data"
    response = Net::HTTP.get(URI(url))
    data = JSON.parse(response)

    book_data = data["ISBN:#{isbn}"]
    return nil unless book_data

    {
      title: book_data["title"],
      author: book_data["authors"]&.first["name"],
      isbn: isbn
    }
  end


  has_many :reviews, dependent: :destroy
  has_one_attached :cover_image
  
  validates :title, :author, presence: true
  validates :isbn, uniqueness: true, allow_nil: true
  
end
