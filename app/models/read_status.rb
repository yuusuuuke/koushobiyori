class ReadStatus < ApplicationRecord
  
  has_many :books, dependent: :destroy
  
end
