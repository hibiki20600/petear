class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_many :goods
  has_many :good_users, through: :goods, source: :user
  validates :image, presence: true, unless: :video?
  validates :image, absence: true, if: :video?
  mount_uploader :image, ImageUploader
  mount_uploader :video, VideoUploader
end
