class Post < ApplicationRecord
  belongs_to :users, class_name: 'User'
  has_many :comments, foreign_key: 'post_id'
  has_many :likes, foreign_key: 'post_id'

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_create :update_posts_counter

  def update_posts_counter
    users.increment!(:posts_counter)
  end

  def most_recent_comments(id)
    comments.where(post_id: id).limit(5).order(created_at: :desc)
  end
end
