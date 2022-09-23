require_relative '../rails_helper'

RSpec.describe Post, type: :model do
  before :each do
    @user = User.new(name: 'James Rock', photo: 'https:...', bio: 'I am a Teacher')
  end
  subject { Post.new(title: 'Politics', text: 'I like politics', users: @user) }

  before { subject.save }

  it 'title must not be blank.' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title must not exceed 250 characters.' do
    subject.title = "Lorem ipsum dolor sit amet, consectetur adipiscing elit,
                    sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                    Ut enim ad minim veniam, quis nostrud exercitation ullamco
                    laboris nisi ut aliquip ex ea commodo consequat.
                    Duis aute irure dolor in reprehenderit in voluptate velit esse cillum
                    dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident,
                    sunt in culpa qui officia deserunt mollit anim id est laborum."
    expect(subject).to_not be_valid
  end

  it 'CommentsCounter must be an integer greater than or equal to zero.' do
    subject.comments_counter = nil
    expect(subject).to_not be_valid
  end

  it 'LikesCounter must be an integer greater than or equal to zero.' do
    subject.comments_counter = -5
    expect(subject).to_not be_valid
  end

  it 'like_counter should increment by 1' do
    subject.update_posts_counter
    expect(@user.posts_counter).to eq(1)
  end
end
