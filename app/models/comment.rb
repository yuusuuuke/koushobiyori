class Comment < ApplicationRecord
  
  validates :comment,presence:true,length:{ maximum:200 }
  
  belongs_to :user
  belongs_to :review
  
  scope :create_latest, -> {order(created_at: :desc)}
end
