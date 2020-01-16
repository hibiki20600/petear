class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :group_users
  has_many :groups, through: :group_users
  has_many :messages, dependent: :destroy
  has_many :group_followers
  has_many :followings, through: :group_followers, source: :group
  has_many :goods
  has_many :gooded_messages, through: :goods, source: :message
  mount_uploader :image, ImageUploader
  validates :image, presence: true
  validates :name, presence: true
   
  def alreadyGood?(message)
    self.gooded_messages.include?(message)
  end

end
