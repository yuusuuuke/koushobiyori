class Admin::ReviewsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    if params[:create_latest]
      @reviews = Review.order(created_at: :desc)
    elsif params[:update_latest]
      @reviews = Review.order(created_at: :desc)
    elsif params[:score_revel]
      @reviews = Review.order(score: :asc)
    else
      @reviews = Review.order(created_at: :desc)
    end
  end
  
  def destroy
    review = Review.find(params[:id])
    if review.destroy
      flash[:success] = "レビューを削除しました"
      redirect_to request.referrer
    else
      flash.now[:danger] = "レビューを削除できませんでした"
      render "index"
    end
  end
end
