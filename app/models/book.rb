class Book < ApplicationRecord
  
  validates :title, presence: true
  
  belongs_to :category,optional: true
  belongs_to :read_status, foreign_key: 'read_status_id'
  has_many :reviews, dependent: :destroy
  
# 検索機能
  def self.looks(search, word)
    if search == "perfect_match"
      @book = Book.where("title LIKE?","#{word}")
    elsif search == "forward_match"
      @book = Book.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @book = Book.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @book = Book.where("title LIKE?","%#{word}%")
    else
      @book = Book.all
    end
  end
  
end
