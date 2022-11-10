class ReadStatus < ApplicationRecord
  
  validates :status, presence:true
  
  has_many :books
  enum status: { read: 0, reading: 1, wish: 2 }
  
end
