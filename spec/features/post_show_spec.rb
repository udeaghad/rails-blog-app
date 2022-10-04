require 'rails_helper'

RSpec.describe 'Home features' do
  it 'should have a home page' do
    visit root_path
    expect(page).to have_content('Welcome to the home page')
  end
  it 'displays all users names' do
    User.create(name: 'Mike', photo: 'https://st.depositphotos.com/1002314/3418/i/950/depositphotos_34185209-stoc
  k-photo-african-business-man.jpg', bio: 'Teacher from Poland.', postscounter: 9)
    visit root_path

    expect(page).to have_content('Mike')
  end
  it 'displays all users posts' do
    User.create(name: 'Mike', photo: 'https://st.depositphotos.com/1002314/3418/i/950/depositphotos_34185209-stoc
   k-photo-african-business-man.jpg', bio: 'Teacher from Poland.', postscounter: 9)
    visit root_path

    expect(page).to have_content(9)
  end
  it 'displays all users pictures with correct alt texts' do
    User.create(name: 'Mike', photo: 'https://man.jpg', bio: 'Teacher from Poland.', postscounter: 9)
    visit root_path
    find('img[alt="Mike"]')
  end
  it 'displays a link to see Profile of each user' do
    User.create(name: 'Mike', photo: 'https://st.depositphotos.com/1002314/3418/i/950/depositphotos_34185209-stoc
   k-photo-african-business-man.jpg', bio: 'Teacher from Poland.', postscounter: 9)
    visit root_path
    click_link('See Profile')
    expect(page).to have_content('Teacher from Poland')
  end
end
