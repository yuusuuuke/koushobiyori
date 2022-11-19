class Admin::CommentsController < ApplicationController
  
  def index
    @comments = Comment.all
    if params[:create_latest]
      @reviews = Review.includes(@comments).order(created_at: :desc)
    elsif params[:update_latest]
      @reviews = Review.includes(@comments).order(created_at: :desc)
    else
      @reviews = Review.includes(@comments).order(created_at: :desc)
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
