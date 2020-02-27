class Freriqu < ApplicationRecord
  belongs_to :invite, class_name: "User"
  belongs_to :invited, class_name: "User"
end
