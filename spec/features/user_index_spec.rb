require 'rails_helper'

RSpec.describe 'Home features' do
  it 'should have a home page' do
    visit root_path
    expect(page).to have_content('Here is a list of all users')
  end

  it 'displays all users names' do
    User.create(name: 'Grace', photo: 'https://unsplash...', bio: 'Teacher from Poland.', posts_counter: 1)
    visit root_path
    expect(page).to have_content('Grace')
  end

  it 'displays posts counter' do
    User.create(name: 'Grace', photo: 'https://unsplash...', bio: 'Teacher from Poland.', posts_counter: 1)
    visit root_path
    expect(page).to have_content('Number of posts:1')
  end

  it 'displays profile picture of each user' do
    User.create(name: 'Grace', photo: 'https://unsplash...', bio: 'Teacher from Poland.', posts_counter: 1)
    visit root_path
    expect(page).to have_css("img[src*='https://unsplash...']")
  end
end