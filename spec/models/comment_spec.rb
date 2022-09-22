require_relative '../rails_helper'

RSpec.describe Comment, type: :model do

  before :each do
    @user = User.new(name: 'James Rock', photo: 'https:...', bio: 'I am a Teacher')
    @post = Post.new(title: 'Politics', text: 'I like politics', users: @user)
  end
  
  subject {Comment.new(text: 'Lorem ipsum dolor sit...', users_id: 1, posts: @post)}

  before { subject.save }

  it 'text must not exceed 250 characters..' do
    subject.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
                    sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
                    Ut enim ad minim veniam, quis nostrud exercitation ullamco 
                    laboris nisi ut aliquip ex ea commodo consequat. 
                    Duis aute irure dolor in reprehenderit in voluptate velit esse cillum 
                    dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, 
                    sunt in culpa qui officia deserunt mollit anim id est laborum."

    expect(subject).to_not be_valid
  end

  it 'at first like_counter should be 1' do
    subject.update_comments_counter
    expect(@post.comments_counter).to eq(1)
  end

  
end