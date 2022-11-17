class Public::BooksController < ApplicationController
  def index
  end

  def show#commentとreviewのcontrollerでrender入れてる
    @book = Book.find(params[:id])
    @review = Review.new
    @reviews = @book.reviews.includes(:comments)
    @user_review = Review.find_by(book_id: @book.id, user_id: current_user.id)
    @user_book = current_user.read_status.find_by(book_id: @book.id)
  end
  
  def read
    @user = User.find(params[:user_id])
    @read = @user.read_status.where(status: 1).order(created_at: :desc)
  end
  
  def reading
    @user = User.find(params[:user_id])
    @reading = @user.read_status.where(status: 2).order(created_at: :desc)
  end
  
  def wish
    @user = User.find(params[:user_id])
    @wish = @user.read_status.where(status: 3).order(created_at: :desc)
  end
  
  def reviews
    @user = User.find(params[:user_id])
    @reviews = @user.reviews.all.order(created_at: :desc)
  end
end
