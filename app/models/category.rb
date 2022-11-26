class Category < ApplicationRecord
  
  validates :name, presence: true, uniqueness: true
  validates :genre_code, uniqueness: true
  has_many :books, dependent: :destroy
end
