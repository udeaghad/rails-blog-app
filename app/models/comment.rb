class Comment < ApplicationRecord
  belongs_to :users, class_name: 'User'
  belongs_to :posts, class_name: 'Post'

  validates :text, length: { maximum: 250 }

  after_create :update_comments_counter

  def update_comments_counter
    posts.increment!(:comments_counter)
  end
end
