class Public::UsersController < ApplicationController
    def show
      @user = User.find(params[:id])
      @read = @user.read_status.where(status: 1)
      @reading = @user.read_status.where(status: 2)
      @wish = @user.read_status.where(status: 3)
      @reviews = @user.reviews.all
    end
  
    def edit
      @user = User.find(params[:id])
    end
    
    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to user_path(@user.id),notice:"アカウント情報を変更しました"
      else
        render :edit
      end
    end
    
    def followings
      @user = User.find(params[:id])
      @users = @user.followings
    end
  
    def followers
      @user = User.find(params[:id])
      @users = @user.followers
    end
  
    def confirm
    end
    
    def withdraw
      @user = current_user
      @user.update(is_active: false)
      reset_session
      flash[:notice] = "退会処理が完了しました。"
      redirect_to root_path
    end
  
  private
    def user_params
      params.require(:user).permit(:nickname, :profile_image, :introduction)
    end


end