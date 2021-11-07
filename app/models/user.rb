class User < ApplicationRecord
  has_secure_password
  before_save { email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :profile, length: { maximum: 255 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false } 

  mount_uploader :image, ImageUploader
  has_many :posts
  has_many :comments
end
