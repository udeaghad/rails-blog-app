class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @post = @user.posts
  end

  def new
    @post = Post.new

    respond_to do |format|
      format.html { render :new, locals: { post: @post } }
    end
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.comments_counter = 0
    @post.likes_counter = 0

    respond_to do |format|
      format.html do
        if @post.save
          flash[:success] = 'Post created successfully'
          redirect_to user_path(current_user)
        else
          flash.now[:error] = 'Error: Post could not be saved'
          redirect_to new_user_post_path(current_user)
        end
      end
    end
  end

  def show
    @post = Post.where('id = ?', params[:id])
    @comments = Comment.includes(:user).where('post_id = ?', params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
      if @post.update(post_params)
        flash[:success] = "Post was successfully updated"
        redirect_to user_path(@post.user_id)
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end
  
  

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
