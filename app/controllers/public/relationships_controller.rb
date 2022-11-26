class Public::RelationshipsController < ApplicationController
   before_action :authenticate_user!
  
  def create
    followings = Relationship.new
    followings.follower_id = current_user.id
    followings.followed_id = params[:user_id]
    followings.save
    redirect_to request.referrer || root_path
  end
  
  def destroy
    followings = current_user.relationships.find_by(followed_id: params[:user_id])
    followings.destroy
    redirect_to request.referrer || root_path
  end
end
