class Comment < ApplicationRecord
  
  validates :comment,presence:true,length:{ minimum: 2, maximum: 200 }
  
  belongs_to :user
  belongs_to :review
  
  scope :create_latest, -> {order(created_at: :desc)}
  scope :score_revel, -> {order(score, created_at: :asc)}
end
