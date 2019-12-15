class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :content, length: {in: 1..70}
end
