class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    if params[:create_latest]
      # binding.pry
      @reviews = Review.joins(:comments).group(:id).order("comments.created_at desc")
    else
      @reviews = Review.joins(:comments).group(:id)
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
