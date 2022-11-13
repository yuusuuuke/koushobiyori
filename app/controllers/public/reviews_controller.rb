class Public::ReviewsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @book = Book.find(params[:book_id])
    review = current_user.reviews.new(review_params)
    review.book_id = @book.id
    review.save
    redirect_to request.referrer
  end  
  
  def update
    review = Review.find(params[:id])
    review.update(review_params)
    redirect_to request.referrer
  end  
  
  
  private
  def review_params
    params.require(:review).permit(:comment) 
  end
  
end
