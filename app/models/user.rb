class User < ApplicationRecord
  has_many :posts, foreign_key: 'users_id'
  has_many :comments, foreign_key: 'users_id'
  has_many :likes, foreign_key: 'users_id'

  def most_recent_posts
    posts.limit(3).order(created_at: :desc)
  end
end
