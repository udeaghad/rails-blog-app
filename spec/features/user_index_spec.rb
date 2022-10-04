require 'rails_helper'

RSpec.describe 'User#index' do
  before :each do
    @grace = User.create(name: 'Grace', photo: 'https://unsplash...', bio: 'Teacher from Poland.', posts_counter: 1)
  end

  before(:example) { visit root_path }
  it 'should have a home page' do
    expect(page).to have_content('Here is a list of all users')
  end

  it 'displays all users names' do
    expect(page).to have_content('Grace')
  end

  it 'displays posts counter' do
    expect(page).to have_content('Number of posts:1')
  end

  it 'displays profile picture of each user' do
    expect(page).to have_css("img[src*='https://unsplash...']")
  end

  it 'routing' do
    click_link('Grace')
    expect(page).to have_current_path(user_path(@grace))
  end
end
