class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :categories
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user
  belongs_to :user

  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 255 }
  validates :content, presence: true, length: { minimum: 10 }
end
