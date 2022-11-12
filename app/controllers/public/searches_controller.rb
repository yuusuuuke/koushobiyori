class Public::SearchesController < ApplicationController
   before_action :authenticate_user!
   
  def search_result
    @books = Book.looks(params[:search], params[:word])#looks：Bookkmodel内で定義してる
  end
  
end

