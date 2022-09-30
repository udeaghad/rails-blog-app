class LikesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])

    like = current_user.likes.new(users_id: current_user.id, posts_id: params.require(:post_id))
   

    respond_to do |format|
      format.html do
        if like.save
          flash[:success] = "Post Liked"
          redirect_to user_posts_path(@post.users_id )
        else
          flash.now[:error] = "Error: Like not be saved"
          redirect_to user_posts_path(current_user)
        end
      end
    end

  end

end