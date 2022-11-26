class Book < ApplicationRecord
  is_impressionable counter_cache: true
  
  validates :title, presence: true
  validates :isbn, uniqueness: true
  
  belongs_to :category,optional: true
  has_many :read_status, dependent: :destroy
  has_many :reviews, dependent: :destroy
  
# 検索機能
  def self.looks(_search, word)
    @book = Book.where("title LIKE?","%#{word}%")
  end
end
