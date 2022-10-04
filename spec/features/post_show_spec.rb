require 'rails_helper'

RSpec.describe 'Post#show' do
  before :each do
    @mark = User.create(name: 'Mark', photo: 'https://unsplash...', bio: 'Teacher from Poland.', posts_counter: 1)
    @george = User.create(name: 'George', photo: 'https://unsplash...', bio: 'Teacher from England.', posts_counter: 0)
    @mark_post = Post.create(
      {user: @mark, title: 'Driving', text: 'text for 1', likes_counter: 2, comments_counter: 1}
      )
      Comment.create(text: 'Lorem ipsum dolor sit...', user: @george, post: @mark_post)       
  end

 

  before(:example) { visit user_post_path(@mark, @mark_post) }

  it 'displays the post title' do    
    expect(page).to have_content("Title: Driving")
  end

  it 'displays who wrote the post' do    
    expect(page).to have_content("Post by Mark")
  end

  it 'displays the number of comments' do    
    expect(page).to have_content("Comments: 2")
  end

  it 'displays the number of likes' do    
    expect(page).to have_content("Likes: 2")
  end

  it 'displays the body of the post' do    
    expect(page).to have_content("text for 1")
  end

  it 'displays the username of each commenter' do    
    expect(page).to have_content("George")
  end

  it 'displays the comment by each commentor' do    
    expect(page).to have_content("Lorem ipsum")
  end

end
