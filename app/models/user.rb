class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable #, :omniauthable, omniauth_providers: [:twitter]
  has_many :posts, dependent: :destroy

  validates_uniqueness_of :username
  validates_presence_of :username
end
