class Public::BooksController < ApplicationController
  def index
  end

  def show
    @book = Book.find(params[:id])
    @review = Review.new
    @reviews = Review.all
    @rreview = current_user.reviews.where(book_id: @book.id)
  end


end
