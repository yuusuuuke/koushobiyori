class Admin::BooksController < ApplicationController

  def show
    @book = Book.find(params[:id])
  end

  def edit
  end

# private
#   def params_book
#     params.require(:book).permit(
#       :read_status_id,
#       :category_id,
#       :title,
#       :author,
#       :isbn,
#       :item_url
#       )
#   end

end
