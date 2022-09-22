class User < ApplicationRecord
  has_many :posts, foreign_key: 'users_id'
  has_many :comments, foreign_key: 'users_id'
  has_many :likes, foreign_key: 'users_id'

  validates :name, presence: true
  validates :posts_counter, numericality: {only_integer: true, greater_than_or_equal_to: 0 }

  def most_recent_posts
    posts.limit(3).order(created_at: :desc)
  end
end
