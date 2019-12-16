class Post < ApplicationRecord
  mount_uploader :content, ImageUploader
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  validates :content, presence: true
  validates :caption, length: {maximum: 140}
end
