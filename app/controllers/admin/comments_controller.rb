class Admin::CommentsController < ApplicationController
  
  def index
    if params[:create_latest]
      @reviews = Review.joins(:comments).order("comments.created_at desc")
    else
      @reviews = Review.joins(:comments)
    end
  end
  
  def destroy
    comment = Comment.find(params[:id])
    if comment.destroy
      flash[:success] = "コメントを削除しました"
      redirect_to request.referrer
    else
      flash.now[:danger] = "コメントを削除しました"
      render "index"
    end
  end
end
