
# Book Review Hub
Overview
Book Review Hub is a Ruby on Rails application where users can submit and browse reviews for books. The app integrates with an external API to fetch book details and allows users to upload cover images. This project demonstrates working with APIs, file uploads, and Rails fundamentals such as MVC, Active Record, and routing.

Features
1. User-friendly interface for adding and viewing books.
2. API Integration with Open Library to fetch book details. 
3. File Upload for book cover images using Active Storage.
4. Pagination for better navigation.
5. Search Functionality to find books by title or author.
6. CRUD Operations for books and reviews.
7. RSpec/Minitest Tests for model and controller validation.

Installation
1. Clone the repository
2. ruby version 3.3.0
3. Rails version 8.0.1
4. Navigate to the project directory
5. Run `bundle install`
6. Run `rails db:migrate`
7. Run `rails db:seed` for all database
8. Start the server 'rails server'

Usage
Adding a Book
1. Navigate to the "Add Book" page.
2. Enter book details manually or use the ISBN lookup.
3. Optionally, upload a book cover image.

Adding a Review
1. Select a book.
2. Submit a review with a rating (1-5) and text content.

Searching for Books
1. Use the search bar to find books by title.