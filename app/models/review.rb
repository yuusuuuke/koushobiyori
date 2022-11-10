class Review < ApplicationRecord
  
  validates :comment, presence: true, length: {maximam: 200 }
  
  belongs_to :user
  belongs_to :book
  has_many :post_coments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
end
