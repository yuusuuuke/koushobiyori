class Public::HomesController < ApplicationController
  before_action :authenticate_user!, except: [:about]
  
  def top
    @categories = Category.all
    @reviews = Review.group(:book_id).order(count_all: :desc).limit(18).count
    # @follower_ranking = User.followers.group(:followed_id).order(count_all: :desc).limit(20).count
    @follower_ranking = Relationship.group(:followed_id).order(count_all: :desc).limit(20).count
    @count_books = Book.order(impressions_count: 'DESC').limit(18)
  end

  def about
  end
end
