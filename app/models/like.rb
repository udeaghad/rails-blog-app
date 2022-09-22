class Like < ApplicationRecord
  belongs_to :users, class_name: 'User'
  belongs_to :posts, class_name: 'Post'

  after_create :update_likes_counter

  def update_likes_counter
    posts.increment!(:likes_counter)
  end
end
