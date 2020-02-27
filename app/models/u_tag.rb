class UTag < ApplicationRecord
  belongs_to :user
  has_many :u_tag_groups
  has_many :groups, through: :u_tag_groups
  validates :tag, presence: true
end
