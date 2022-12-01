class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @users =User.order(created_at: :desc).page(params[:page]).per(30)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    if params[:create_latest]
      @reviews = @user.reviews.order(created_at: :desc)
    elsif params[:update_latest]
      @reviews = @user.reviews.order(updated_at: :desc)
    else
      @reviews = @user.reviews
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to edit_admin_user_path(@user), flash: { success: "会員情報を更新しました。"}
    else
      flash.now[:danger] = "会員情報を更新できませんでした"
      render :edit
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    if @user.nickname == "guestuser"
      @user.destroy
      flash[:success] = "ゲストユーザを削除しました"
      redirect_to admin_path
    else
      flash.now[:danger] = "ゲストユーザを削除できませんでした"
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :profile_image, :email, :is_active)
  end
end
