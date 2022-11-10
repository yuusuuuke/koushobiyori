class Admin::BooksController < ApplicationController
  def search
    @q = Book.ransack(params[:q]) #[:q]はransackのデフォルトのパラメーターキー
    @books = @q.result(distinct: true)
    @books.each do |book|
      book.title
      book.author
      book.item_image_url
    end
  end

  def search_api
  end

  def show
  end

  def edit
  end
end
