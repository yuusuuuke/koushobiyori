class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :nickname, presence: true, uniqueness: true, length: { minimum: 2, maximum: 30 }
  validates :introduction, length: { maximum: 100}
  has_one_attached :profile_image
  
  def get_profile_image(weight,height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
    profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image_jpeg')
    end
    profile_image.variant(resize_to_fill: [weight, height]).processed
  end
  
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :read_status, dependent: :destroy
  
  
#フォロー機能
  has_many :relationships,foreign_key:"follower_id",dependent: :destroy#フォローした人のID
  has_many :reverse_of_relationships,class_name:"Relationship",foreign_key:"followed_id",dependent: :destroy
  
  has_many :followings, through: :relationships,source: :followed
  has_many :followers, through: :reverse_of_relationships,source: :follower
  
#フォローした時の処理
  def follow(user_id) 
    relationships.create(followed_id: user_id)
  end
#フォローを外す時の処理
  def unfolllow(user_id)
    relatinonships.find_by(followed_id: user_id).destroy
  end
  
#フォローしているかの判定
  def following?(user)
    followings.include?(user)
  end
  
# 検索機能
  def self.looks(_search, word)
      @user = User.where("nickname LIKE?","%#{word}%")
  end
  
# ゲストログイン機能
  def self.guest
    find_or_create_by!(nickname: 'guestuser' ,email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.nickname = "guestuser"
    end
  end
  
end
