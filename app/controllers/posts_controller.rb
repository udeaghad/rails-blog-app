class PostsController < ApplicationController
  def index 
    @user = User.find(params[:user_id])
    @posts = @user.posts
    # @comments = @posts.each { |post| post.most_recent_comments(post.id)}
  end

  def show; end
end
