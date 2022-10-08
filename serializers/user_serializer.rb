class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :bio

  has_many :posts, foreign_key: 'user_id'
  has_many :comments, foreign_key: 'user_id'
end
