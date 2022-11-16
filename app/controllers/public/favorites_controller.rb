class Public::FavoritesController < ApplicationController

  def create
    @review_favorite = Review.find(params[:review_id])
    @book = Book.find(params[:book_id])
    # @reviews = @book.reviews.includes(:comments)
    favorite = current_user.favorites.new(review_id: @review_favorite.id)
    favorite.save
  end
  
  def destroy
    @review_favorite = Review.find(params[:review_id])
    @book = Book.find(params[:book_id])
    # @reviews = @book.reviews.includes(:comments)
    favorite = current_user.favorites.find_by(review_id: @review_favorite.id)
    favorite.destroy
  end
end
