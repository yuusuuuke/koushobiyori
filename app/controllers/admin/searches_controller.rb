class Admin::SearchesController < ApplicationController
  before_action :authenticate_admin!
  def search
    @range = params[:range]
    if @range == "User"
      @users = User.looks(params[:search], params[:word])
    else
      @books = Book.looks(params[:search], params[:word])
    end
  end
end
