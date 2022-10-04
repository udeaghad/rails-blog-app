require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before :each do
    @grace = User.create(name: 'Grace', photo: 'https://unsplash...', bio: 'Teacher from Poland.', posts_counter: 1)    
  end 
  describe 'GET /posts#index' do
    before(:example) { get user_posts_path(@grace) }
    it 'works! (checked http status)' do
      expect(response).to have_http_status(200)
    end

    it 'renders index template ' do
      expect(response).to render_template('index')
    end

    it 'page contains the correct text' do
      expect(response.body).to include('Here is a list of all posts for a given user')
    end
  end

  describe 'GET /posts#show' do
  before :each do
    @mark = User.create(name: 'Mark', photo: 'https://unsplash...', bio: 'Teacher from Poland.', posts_counter: 1)
    @mark_post = Post.create(
      {user: @mark, title: 'Driving', text: 'text for 1', likes_counter: 2, comments_counter: 1}
      )
          
  end
    before(:example) { get user_post_path(@mark, @mark_post) }
    it 'works! (checked http status)' do
      expect(response).to have_http_status(200)
    end

    it 'renders show template ' do
      expect(response).to render_template(:show)
    end

    it 'page contains the correct text' do
      expect(response.body).to include('Here is a list of all posts for a given user and for a given post')
    end
  end
end
