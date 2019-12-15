class Post < ApplicationRecord
  mount_uploader :content, ImageUploader
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :content, presence: true
  validates :caption, length: {maximum: 140}
end
