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
    @book = Book.find(params[:book_id])
    comment = PostComment.find_by(id: params[:id], book_id: params[:book_id] )
    if comment.user_id != current_user.id
      render :show
    end
    comment.destroy
  end

  private
  
  def comment_params
    params.require(:comment).permit(:comment, :review_id)
  end
end
