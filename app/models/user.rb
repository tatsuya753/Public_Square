class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  # フォローをした、されたの関係
has_many :followers, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
has_many :followeds, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

# 一覧画面で使う
has_many :following_users, through: :followers, source: :followed
has_many :follower_users, through: :followeds, source: :follower

  #　フォローしたときの処理
  def follow(user_id)
    followers.create(followed_id: user_id)
  end

  #　フォローを外すときの処理
  def unfollow(user_id)
    followers.find_by(followed_id: user_id).destroy
  end

  #フォローしていればtrueを返す
  def following?(user)
    following_users.include?(user)
  end

  has_one_attached :profile_image

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      profile_image.variant(resize_to_limit: [width, height]).processed
  end

end
