class Public::UsersController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    @user = User.find(params[id])
  end

  def unsubscribe
  end
end
