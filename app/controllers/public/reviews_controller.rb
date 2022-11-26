class Public::ReviewsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @book = Book.find(params[:book_id])
    review = current_user.reviews.new(review_params)
    review.book_id = @book.id
    if review.save
      flash[:success] = "レビューを投稿しました"
      redirect_to request.referrer
    else
      flash[:danger] = "レビューを投稿できませんでした"
      @review = Review.new
      @reviews = @book.reviews.includes(:comments)
      @user_review = Review.find_by(book_id: @book.id, user_id: current_user.id)
      @user_book = current_user.read_status.find_by(book_id: @book.id)
      redirect_to request.referrer
    end
  end  
  
  def update
    @book = Book.find(params[:book_id])
    review = @book.reviews.find_by(book_id: @book.id, user_id: current_user.id)
    if review.update(review_params)
      flash[:success] = "レビューを更新しました"
      redirect_to request.referrer
    else
      flash.now[:danger] = "レビューを更新できませんでした"
      @review = Review.new
      @reviews = @book.reviews.includes(:comments)
      @user_review = Review.find_by(book_id: @book.id, user_id: current_user.id)
      @user_book = current_user.read_status.find_by(book_id: @book.id)
      render 'public/books/show'
    end
  end
  
  def destroy
    book = Book.find(params[:book_id])
    review = book.reviews.find_by(book_id: book.id, user_id: current_user.id)
    if review.destroy
      flash[:success] = "レビューを削除しました"
      redirect_to request.referrer
    else
      flash.now[:danger] = "レビューを削除できませんでした"
      @book = Book.find(params[:id])
      @review = Review.new
      @reviews = @book.reviews.includes(:comments)
      @user_review = Review.find_by(book_id: @book.id, user_id: current_user.id)
      @user_book = current_user.read_status.find_by(book_id: @book.id)
      render "public/books/show"
    end
  end
  
  private
  def review_params
    params.require(:review).permit(:comment)
  end
end
