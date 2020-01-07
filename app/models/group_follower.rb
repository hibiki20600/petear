class GroupFollower < ApplicationRecord
  belongs_to :follower, class_name: 'User'
  belongs_to :group
end
