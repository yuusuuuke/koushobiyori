class Public::BooksController < ApplicationController
  def index
  end

  def show
    @book = Book.find(params[:id])
    @review = Review.new
  end


end
