class ReadStatus < ApplicationRecord
  
  belongs_to :user, foreign_key: 'user_id', optional: true
  belongs_to :book, foreign_key: 'book_id', optional: true
  
  enum satus: { read: 1, reading: 2, wish: 3 }
end