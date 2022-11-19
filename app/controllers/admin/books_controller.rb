class Admin::BooksController < ApplicationController

  def show
    @book = Book.find(params[:id])
  end
  
  def index
    @books = Book.all.order(created_at: :desc)
  end
  
  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.save
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
