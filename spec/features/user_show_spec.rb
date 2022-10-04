require 'rails_helper'

RSpec.describe 'User#Show features' do
  before :each do
    @mark = User.create(name: 'Mark', photo: 'https://unsplash...', bio: 'Teacher from Poland.', posts_counter: 1)

    @mark_post = Post.create([
                               { user: @mark, title: 'Driving', text: 'text for 1', likes_counter: 2,
                                 comments_counter: 1 },
                               { user: @mark, title: 'Cooking', text: 'text for 2', likes_counter: 3,
                                 comments_counter: 1 },
                               { user: @mark, title: 'Dancing', text: 'text for 3', likes_counter: 0,
                                 comments_counter: 1 },
                               { user: @mark, title: 'Reading', text: 'text for 4', likes_counter: 0,
                                 comments_counter: 0 },
                               { user: @mark, title: 'Singing', text: 'text for 5', likes_counter: 1,
                                 comments_counter: 1 }
                             ])
  end

  before(:example) { visit user_path(@mark) }
  it "displays a user's name" do
    expect(page).to have_content('Mark')
  end

  it 'displays profile picture of each user' do
    expect(page).to have_css("img[src*='https://unsplash...']")
  end

  it 'displays number of posts' do
    expect(page).to have_content('Number of posts: 6')
  end

  it 'displays Bio text' do
    expect(page).to have_content('Bio: Teacher from Poland.')
  end

  it 'displays user\'s first 3 posts.' do
    expect(page).to_not have_content('text for 1')
    expect(page).to_not have_content('text for 2')
    expect(page).to have_content('text for 3')
    expect(page).to have_content('text for 4')
    expect(page).to have_content('text for 5')
  end

  it 'displays button' do
    #  Post.create([
    #     {user: @mark, title: 'Driving', text: 'text for 1', likes_counter: 2, comments_counter: 1},
    #     {user: @mark, title: 'Cooking', text: 'text for 2', likes_counter: 3, comments_counter: 1},
    #     {user: @mark, title: 'Dancing', text: 'text for 3', likes_counter: 0, comments_counter: 1},
    #     {user: @mark, title: 'Reading', text: 'text for 4', likes_counter: 0, comments_counter: 0},
    #     {user: @mark, title: 'Singing', text: 'text for 5', likes_counter: 1, comments_counter: 1}
    #   ])

    click_button('See all posts')
    find(:button)
  end

  it 're-direct to post#show page when post title is clicked' do
    #  mark_post =  Post.create(
    # {user: @mark, title: 'Driving', text: 'text for 1', likes_counter: 2, comments_counter: 1}
    # )

    click_link('Singing')
    expect(page).to have_current_path(user_post_path(@mark_post[4].user_id, @mark_post[4].id))
  end

  it 're-direct to post#index page when \'see all posts\' button is clicked' do
    # mark_post = Post.create(
    #   {user: @mark, title: 'Driving', text: 'text for 1', likes_counter: 2, comments_counter: 1}
    #   )
    click_link('See all posts')
    expect(page).to have_current_path(user_posts_path(@mark))
  end
end
