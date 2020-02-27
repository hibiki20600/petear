class Group < ApplicationRecord
  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users
  has_many :messages, dependent: :destroy
  has_many :group_followers, dependent: :destroy
  has_many :followers, through: :group_followers
  has_many :u_tag_groups
  has_many :u_tags, through: :u_tag_groups
  accepts_nested_attributes_for :u_tag_groups
  mount_uploader :image, ImageUploader

  def follow(user)
    self.group_followers.find_or_create_by(follower_id: user.id)
  end


  def unfollow(user)
    relationship = self.group_followers.find_by(follower_id: user.id)
    relationship.destroy if relationship
   end

  def following?(user)
    self.followers.include?(user)
  end

  def member?(user)
    self.users.include?(user)
  end

  def owner?(user_id)
    self.owner_id == user_id
  end

end
