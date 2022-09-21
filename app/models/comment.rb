class Comment < ApplicationRecord
  belong_to :users
  belong_to :posts
end
