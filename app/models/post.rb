class Post < ApplicationRecord
  belongs_to :users, class_name: 'User'
  has_many :comments, foreign_key: 'posts_id'
  has_many :likes, foreign_key: 'posts_id'

  after_create :update_posts_counter

  def update_posts_counter
    users.increment!(:posts_counter)
  end

  def most_recent_comments
    comments.limit(5).order(created_at: :desc)
  end
end
