class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @post = Post.where('id = ?', params[:id])
    @comments = Comment.where('posts_id = ?', params[:id])
  end
end
