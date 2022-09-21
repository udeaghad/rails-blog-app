class Comment < ApplicationRecord
  belongs_to :users, class_name: 'User'
  belongs_to :posts, class_name: 'Post'
end
