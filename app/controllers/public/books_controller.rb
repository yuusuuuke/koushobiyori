class Public::BooksController < ApplicationController
  def index
  end

  def show
    @book = Book.find(params[:id])
    @review = Review.new
    @reviews = @book.reviews.includes(:comments)
    @review_edit = Review.find_by(book_id: @book.id, user_id: current_user.id)

  end


end
