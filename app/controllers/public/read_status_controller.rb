class Public::ReadStatusController < ApplicationController
  before_action :authenticate_user!
  
   def update
     if current_user.read_status.find_by(book_id: params[:book_id]).present? 
       read_status = current_user.read_status.last
       if read_status.status == params[:status]
         read_status.delete
       else
         read_status.status = params[:status]
         read_status.save!
       end
     else 
       read_status = ReadStatus.new
       read_status.user_id = current_user.id
       read_status.book_id = params[:book_id]
       read_status.status = params[:status]
       read_status.save!
     end
     redirect_to book_path(params[:book_id]) 
   end



#       book.read_status = 1
#       book.read_status.update(book_params)
#     end
#   end 
#     # read_statusカラムにユーザーと本のidなかったら作る
#     # もしread_status_idが同じ番号だったら、read_status_idを１に更新
#     # 違う数字だったら、送られてきた番号に更新
#     # 

 end
