require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users#index' do
    before(:example) { get users_path }
    it 'works! (checked https status)' do
      expect(response).to have_http_status(200)
    end

    it 'renders index template ' do
      expect(response).to render_template('index')
    end

    it 'page contains the correct text' do
      expect(response.body).to include('Here is a list of all users')
    end
  end

  describe 'GET /users#show' do
  before :each do
    @grace = User.create(name: 'Grace', photo: 'https://unsplash...', bio: 'Teacher from Poland.', posts_counter: 1)    
  end 
    before(:example) { get user_path(@grace) }
    it 'works! (checked https status)' do
      expect(response).to have_http_status(200)
    end

    it 'renders show template ' do
      expect(response).to render_template('show')
    end

    it 'page contains the correct text' do
      expect(response.body).to include('Here is for a given user')
    end
  end
end
