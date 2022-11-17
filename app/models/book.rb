class Book < ApplicationRecord
  
  validates :title, presence: true
  
  belongs_to :category,optional: true
  has_many :read_status, dependent: :destroy
  has_many :reviews, dependent: :destroy
  
# 検索機能
  def self.looks(search, word)
    @book = Book.where("title LIKE?","%#{word}%")
  end
end
