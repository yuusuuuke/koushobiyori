class ReadStatus < ApplicationRecord
  
  has_many :books
  enum status: { no_status: 0, read: 1, reading: 2, wish: 3 }
  
end
