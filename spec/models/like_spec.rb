require 'rails_helper'

RSpec.describe Like, type: :model do
  context 'test like class' do
    before :each do
      @user = User.new(name: 'James Rock', photo: 'https:...', bio: 'I am a Teacher')
      @post = Post.new(title: 'Politics', text: 'I like politics', users: @user)
      @comment = Comment.new(text: 'Lorem ipsum dolor sit...', users: @users, posts: @post)
      @like = Like.new(posts: @post, users: @user)
    end

    it 'returns a new Like object' do
      expect(@like).to be_an_instance_of Like
    end

    it 'returns a new Like object' do
      expect(@like).to be_valid
    end

    it 'at first like_counter should be 1' do
      @like.update_likes_counter
      expect(@post.likes_counter).to eq(1)
    end
  end
end
