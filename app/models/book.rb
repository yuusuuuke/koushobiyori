class Book < ApplicationRecord
  
  validates :title, presence: true
  
  belongs_to :category
  belongs_to :read_status
  has_many :reviews, dependent: :destroy
  
# 検索機能
  def self.looks(search, word)
    if search == "partial_match"
      @book = Book.where("title LIKE?","%#{word}%")
    else
      @book = Book.all
    end
  end
  
end
