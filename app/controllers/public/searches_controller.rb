class Public::SearchesController < ApplicationController
   before_action :authenticate_user!
   
  def search_result
    @books = Book.looks(params[:search], params[:word]).order(title: :asc)#looks：Bookmodel内で定義してる
    @word = params[:word]
  end
end

