class Public::CommentsController < ApplicationController

  def create
    @comment = current_user.comments.build(comment_params)
    @book = @comment.review.book
    if @comment.save
      flash[:success] = "コメントしました"
      redirect_to book_path(@book)
    else
      flash.now[:danger] = "コメントできませんでした"
      @review = Review.new
      @reviews = @book.reviews.includes(:comments)
      @review_edit = Review.find_by(book_id: @book.id, user_id: current_user.id)
      render 'public/books/show'
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @book = @comment.review.book
    if @comment.delete
      flash[:success] = "コメントを削除しました"
      redirect_to book_path(@book)
    else
      flash.now[:danger] = "コメントを削除できませんでした"
      @review = Review.new
      @reviews = @book.reviews.includes(:comments)
      @review_edit = Review.find_by(book_id: @book.id, user_id: current_user.id)
      render "public/books/show"
    end
  end

  private
  
  def comment_params
    params.require(:comment).permit(:comment, :review_id)
  end
end
