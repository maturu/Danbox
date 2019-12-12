class Post < ApplicationRecord
  mount_uploader :content, ImageUploader
  belongs_to :user

  validates :content, presence: true
end
