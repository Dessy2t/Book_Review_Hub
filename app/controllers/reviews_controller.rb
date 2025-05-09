class ReviewsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @review = @book.reviews.build(review_params)
  if @review.save
    redirect_to @book, notice: "Review added!"
  else
    redirect_to @book, alert: "Error adding review."
  end
end

def destroy
  @review = Review.find(params[:id])
  @review.destroy
  redirect_to @review.book, notice: "Review added!"
end
private
def review_params
  params.require(:review).permit(:content, :rating)
end
end
 