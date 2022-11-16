class ReadStatus < ApplicationRecord
  
  belongs_to :user, foreign_key: 'user_id', optional: true
  belongs_to :book, foreign_key: 'book_id', optional: true
end
