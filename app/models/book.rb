class Book < ApplicationRecord
  
  
  belongs_to :user
  belongs_to :book_category
  belongs_to :read_status
  has_many :reviews, dependent: :destroy
  

end
