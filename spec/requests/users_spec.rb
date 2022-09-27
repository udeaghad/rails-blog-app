require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    before(:example) { get users_path }
    it "works! (checked https satus)" do
      expect(response).to have_http_status(200)
    end

    it "renders index " do
      expect(response).to render_template('index')
    end
  end
end
