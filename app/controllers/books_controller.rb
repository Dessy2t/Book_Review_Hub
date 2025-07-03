class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :show]
  before_action :set_book, only: %i[edit update destroy]

  def index
    
    if params[:commit]== "Search"
      searched_book = params[:query]
      base = Book.where("title ILIKE :query OR isbn ILIKE :query", {:query=>"%#{searched_book}%"})
      head :accepted
    else
      base = Book.all
    end
    @pagy, @books = pagy(base)
  end

  def show
    @book = Book.find(params[:id])
    @reviews = Review.new
  end

  def new
    @book = Book.new
  end

  def create
    # @book = OpenLibraryService.fetch_book_details(params[:isbn])
    logger.info"#{book_params.inspect}.........................."
    if books_path
      @book = current_user.books.build(book_params)

      if @book.save
        redirect_to @book, notice: "Book added successfully."
      else
        render :new, status: :unprocessable_entity
      end
    else
      flash[:alert] = "No Book found."
      render :new
    end
  end

  def edit
 
  end
 

  def update
    #{}@book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to @book, notice: "Successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path, notice: "successfully deleted."
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :isbn, :cover_image)
  end
end