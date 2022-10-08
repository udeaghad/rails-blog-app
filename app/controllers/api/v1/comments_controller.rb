class Api::V1::CommentsController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments

    render json: @comments
  end

  def create
    # @user = current_user.id
    @user = User.find(params[:user_id])
    @post = @user.find(params[:post_id])

    @comment = @post.comments.create(comment_params)

    if @comment.save
      render json: {
        message: 'Comment was added successfully.'
      }
    else
      render json: {
        message: 'Comment was  not added'
      }
    end
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
