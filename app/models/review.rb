class Review < ApplicationRecord
  
  validates :comment, presence: true, length: {minimum: 2, maximam: 200 }
  
  belongs_to :user
  belongs_to :book
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  scope :create_latest, -> {order(created_at: :desc)}
  scope :update_latest, -> {order(updated_at: :desc)}
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
