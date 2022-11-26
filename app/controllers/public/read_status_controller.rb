class Public::ReadStatusController < ApplicationController
  before_action :authenticate_user!
  
  def update
    read_status = current_user.read_status.find_by(book_id: params[:book_id])
    if read_status.present?
     # binding.pry
      if read_status.status == params[:status].to_i
        read_status.delete
      else
        read_status.status = params[:status].to_i
        read_status.save!
      end
    else
      read_status = ReadStatus.new
      read_status.user_id = current_user.id
      read_status.book_id = params[:book_id]
      read_status.status = params[:status].to_i
      read_status.save!
    end
    redirect_to book_path(params[:book_id]) 
  end
end
