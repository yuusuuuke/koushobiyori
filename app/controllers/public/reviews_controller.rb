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
    # byebug
    book = Book.find(params[:book_id])
    review = book.reviews.find_by(params[:book_id],[:user_id])
    review.update(review_params)
    redirect_to request.referrer
  end
  
  def destroy
    book = Book.find(params[:book_id])
    review = book.reviews.find_by(params[:book_id],[:user_id])
    if review.user_id != current_user.id
      render :show
    else
      review.delete
      redirect_to request.referrer
    end
  end
  
  private
  def review_params
    params.require(:review).permit(:comment)
  end
  
end
