class User < ApplicationRecord
  validates :name, :email, :picture, presence: true
  mount_uploader :picture, PictureUploader
end
