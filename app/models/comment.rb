class Comment < ApplicationRecord
  
  validates :comment,presence:true,length:{ maximum:200 }
  
  belongs_to :user
  belongs_to :review
  
  scope :create_latest, -> {order(created_at: :desc)}
  scope :update_latest, -> {order(updated_at: :desc)}
end
