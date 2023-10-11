class Post < ApplicationRecord

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_one_attached :image

  validates :body, presence: true

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end
