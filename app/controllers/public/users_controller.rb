class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_user, only: [:edit, :update]

    def show
      @user = User.find(params[:id])
      @read = @user.read_status.where(status: 1).order(created_at: :desc).limit(12)
      @reading = @user.read_status.where(status: 2).order(created_at: :desc).limit(12)
      @wish = @user.read_status.where(status: 3).order(created_at: :desc).limit(1)
      @reviews = @user.reviews.all.order(created_at: :desc).limit(10)
      @review_count = @reviews.group(:book_id).count
    end
  
    def edit
      @user = User.find(params[:id])
    end
    
    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        flash[:success] = "アカウント情報を更新しました"
        redirect_to user_path(@user.id)
      else
        flash.now[:danger] = "アカウント情報を更新できませんでした"
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
    
    def follower_rank
      @follower_ranking = Relationship.group(:followed_id).order(count_all: :desc).limit(100).count
    end
  
    def confirm
    end
    
    def withdraw
      @user = current_user
      @user.update(is_active: false)
      reset_session
      flash[:success] = "退会処理が完了しました。"
      redirect_to root_path
    end
  
  private
    def user_params
      params.require(:user).permit(:nickname, :profile_image, :introduction)
    end
    
    def ensure_user
      @user = User.find(params[:id])
      if @user.nickname == "guestuser" || @user != current_user
        redirect_to user_path(current_user), flash: { danger: "ゲストユーザーまたは他のはユーザー編集権限がありません"}
      end
    end
end