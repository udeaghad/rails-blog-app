require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users#index" do
    before(:example) { get users_path }
    it "works! (checked https status)" do
      expect(response).to have_http_status(200)
    end

    it "renders index template " do
      expect(response).to render_template('index')
    end

    it "page contains the correct text" do
      expect(response.body).to include('Here is a list of all users')
    end
  end

  describe "GET /users#show" do
    before(:example) { get user_path(1) }
    it "works! (checked https status)" do
      expect(response).to have_http_status(200)
    end

   
  end
end