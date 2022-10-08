class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :text

  belongs_to :user, class_name: 'User'
  has_many :comments, foreign_key: 'post_id'
end
