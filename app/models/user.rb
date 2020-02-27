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
  has_many :u_tags

  has_many :freriqus, foreign_key: "invite_id", class_name: "Freriqu", dependent: :destroy
  has_many :invite, through: :freriqus
  has_many :follower_relationships, foreign_key: "invited_id", class_name: "Freriqu", dependent: :destroy
  has_many :invited, through: :follower_relationships

  def followed?(user)
    freriqus.find_by(invite_id: user.id)
  end
  
  mount_uploader :image, ImageUploader
  validates :image, presence: true
  validates :name, presence: true
   
  def alreadyGood?(message)
    self.gooded_messages.include?(message)
  end

end
