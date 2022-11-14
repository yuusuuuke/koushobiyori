class Public::ReviewsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @book = Book.find(params[:book_id])
    review = current_user.reviews.new(review_params)
    review.book_id = @book.id
    flash[:success] = "レビューを投稿しました"
    review.save
    redirect_to request.referrer
  end  
  
  def update
    book = Book.find(params[:book_id])
    review = book.reviews.find_by(book_id: book.id, user_id: current_user.id)
    flash[:success] = "レビューを更新しました"
    review.update(review_params)
    redirect_to request.referrer
  end
  
  def destroy
    book = Book.find(params[:book_id])
    review = book.reviews.find_by(book_id: book.id, user_id: current_user.id)
    flash[:success] = "レビューを削除しました"
    if review.delete
      redirect_to request.referrer
    else
      flash.now[:danger] = "レビューを削除できませんでした"
      @book = Book.find(params[:id])
      @review = Review.new
      @reviews = @book.reviews.includes(:comments)
      @user_review = Review.find_by(book_id: @book.id, user_id: current_user.id)
      render "public/books/show"
    end
  end
  
  private
  def review_params
    params.require(:review).permit(:comment)
  end
  
end
