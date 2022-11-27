class Public::FavoritesController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user = User.find(params[:user_id])
    @favorites = Favorite.joins(:review).where(user_id: @user).order(created_at: :desc)
  end
  
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
