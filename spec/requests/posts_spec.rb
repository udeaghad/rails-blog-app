require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /posts#index" do
  before(:example) { get user_posts_path(1) }
    it "works! (checked http status)" do
       expect(response).to have_http_status(200)
    end

    it 'renders index template ' do
      expect(response).to render_template('index')
    end

    it 'page contains the correct text' do
      expect(response.body).to include('Here is a list of all posts for a given user')
    end
  end
end
