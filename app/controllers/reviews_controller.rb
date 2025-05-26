class ReviewsController < ApplicationController
  before_action :authenticate_user!
 
  def create
    @book = Book.find(params[:book_id])
    @review = @book.reviews.build(review_params)

    @review.user = current_user
    
    if @review.save
      redirect_to @book, notice: "Review added!"
    else
      redirect_to @book, alert: "Error adding review."
    end
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.user == current_user
      @review.destroy
      redirect_to @review.book, notice: "Review added!"
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end

 