class Post < ApplicationRecord
  belongs_to :users, class_name: 'User'
  has_many :comments
  has_many :likes
end
