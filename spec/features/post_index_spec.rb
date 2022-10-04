require 'rails_helper'

RSpec.describe 'Post#index' do
  before :each do
    @mark = User.create(name: 'Mark', photo: 'https://unsplash...', bio: 'Teacher from Poland.', posts_counter: 1)
    @mark_post = Post.create(
      {user: @mark, title: 'Driving', text: 'text for 1', likes_counter: 2, comments_counter: 1}
      )
      Comment.create(text: 'Lorem ipsum dolor sit...', user: @mark, post: @mark_post)       
  end

 

  before(:example) { visit user_posts_path(@mark) }

  it 'displays the user\s profile picture' do    
    expect(page).to have_css("img[src*='https://unsplash...']")
  end

  it 'displays the user\s Username' do
   expect(page).to have_content("Mark")
  end

  it 'displays number of posts by the user' do
    expect(page).to have_content("Number of post: 2")
   end

   it 'displays Title' do
    expect(page).to have_content("Title: Driving")
   end

   it 'displays body of the post' do
    expect(page).to have_content("text for 1")
   end

   it 'displays the first comment on the post' do
    expect(page).to have_content("Lorem ipsum dolor")
   end

   it 'displays how many comments a post has' do
    expect(page).to have_content("Comments: 2")
   end

   it 'displays how many likes a post has' do
    expect(page).to have_content("Likes: 2")
   end

   it 're-directs user to post show page' do
    click_link("Driving")
    expect(page).to have_current_path(user_post_path(@mark, @mark_post))
   end
end