class Comment < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  validates :text, length: { maximum: 250 }

  after_create :update_comments_counter

  def update_comments_counter
    post.increment!(:comments_counter)
  end
end
