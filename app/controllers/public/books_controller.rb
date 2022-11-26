class Public::BooksController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @categories = Category.all
    if params[:category_id]
      @category = Category.find(params[:category_id])
      @books = @category.books.order("books.title asc")
    else
      @books = Book.order(title: :asc)
    end
  end

  def show #commentとreviewのcontrollerでrender入れてる
    @book = Book.find(params[:id])
    @review = Review.new
    @reviews = @book.reviews.includes(:comments).order(created_at: :desc)
    @user_review = Review.find_by(book_id: @book.id, user_id: current_user.id)
    @user_book = current_user.read_status.find_by(book_id: @book.id)
    # 観覧数カウント
    impressionist(@book, nil, unique: [:ip_address])
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
  
  def impressions_rank
    @categories = Category.all
    if  params[:category_id]
      @category = Category.find(params[:category_id])
      @count_books = @category.books.order(impressions_count: 'DESC').limit(100)
    else
      @count_books = Book.order(impressions_count: 'DESC').limit(100)
    end
  end
  
  def reviews_rank
    @categories = Category.all
    if params[:category_id].present?
      @category = Category.find(params[:category_id])
      @books = @category.books.joins(:reviews)
      @count_reviews = @books.group(:book_id).order(count_all: :desc).limit(100).count
    else
      @count_reviews = Review.group(:book_id).order(count_all: :desc).limit(100).count
      #Review.group(:book_id).order(count_all: :desc).limit(100)
    end
  end
end
