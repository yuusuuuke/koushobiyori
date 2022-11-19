class Public::HomesController < ApplicationController
  def top
    # byebug
    @review = Review.group(:book_id).order(count_all: :desc).count 
    #book.id: レビュー数のハッシュで情報取れる
  end

  def about
  end
end
