class Admin::BooksController < ApplicationController
  before_action :authenticate_admin!
  
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:success] = "#{@book.title}を作成しました"
      redirect_to "index"
    else
      flash.now[:danger] = "本の新規作成に失敗しました"
      render request.referrer
    end
  end

  def show
    @book = Book.find(params[:id])
  end
  
  def index
    @categories = Category.all
    if params[:category_id]
      @category = Category.find(params[:category_id])
      @books = @category.books.order("books.title asc")
    else
      @books = Book.all.order(created_at: :desc)
    end
  end
  
  def edit
    @categories = Category.all
    @book = Book.find(params[:id])
    @book_category_name = @book.category
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:success] = "#{@book.title}の編集内容を保存しました"
      redirect_to admin_books_path
    else
      flash.now[:danger] = "#{@book.title}の編集内容は保存できませんでした"
      render "edit"
    end
  end
  
  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      flash[:success] = "#{@book.title}を削除しました"
      redirect_to admin_books_path
    else
      flash.now[:danger] = "#{@book.title}は削除できませんでした"
      render "edit"
    end
  end
    
  private
  def book_params
    params.require(:book).permit(:item_image_url, :title, :author, :isbn, :item_url)
  end
end
