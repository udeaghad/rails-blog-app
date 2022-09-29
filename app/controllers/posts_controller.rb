class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def new
    @post = Post.new
    
    respond_to do |format|
      format.html { render :new, locals: { post: @post } }
    end
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :text).merge(users: current_user, comments_counter: 0, likes_counter: 0))

    respond_to do |format|
      format.html do
        if @post.save
          flash[:success] = "Post created successfully"
          redirect_to user_path(current_user)
        else
          flash.now[:error] = "Error: Post could not be saved"
          redirect_to new_user_post_path(current_user)
        end
      end
    end

  end

  def show
    @post = Post.where('id = ?', params[:id])
    @comments = Comment.where('posts_id = ?', params[:id])
    
  end
end
