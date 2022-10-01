class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])

    like = current_user.likes.new
    like.user_id = current_user.id
    like.post_id = post_params

    respond_to do |format|
      format.html do
        if like.save
          flash[:success] = 'Post Liked'
          redirect_to user_posts_path(@post.user_id)
        else
          flash.now[:error] = 'Error: Like not be saved'
          redirect_to user_posts_path(current_user)
        end
      end
    end
  end

  private

  def post_params
    params.require(:post_id)
  end
end
