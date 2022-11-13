class Review < ApplicationRecord
  
  validates :comment, presence: true, length: {minimum: 2, maximam: 200 }
  
  belongs_to :user
  belongs_to :book
  has_many :coments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
end
