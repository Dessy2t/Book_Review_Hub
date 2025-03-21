# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Book.create([
  { title: "Sample Book 1", author: "Author One", isbn: "123-4567890123" },
  { title: "Sample Book 2", author: "Author Two", isbn: "234-5678901234" },
  { title: "Sample Book 3", author: "Author Three", isbn: "345-6789012345" }
])

Review.create([
  { content: "Great book!", rating: 5, book_id: 1 },
  { content: "Interesting read.", rating: 4, book_id: 1 },
  { content: "Not my taste.", rating: 2, book_id: 2 },
  { content: "Loved it!", rating: 5, book_id: 2 },
  { content: "Okay.", rating: 3, book_id: 3 }
])