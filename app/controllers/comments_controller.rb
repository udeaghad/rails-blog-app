class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    respond_to do |format|
      format.html { render :new, locals: { comment: @comment } }
    end
  end

  def create
    @comment = Comment.new(params.require(:comment).permit(:text).merge(users: current_user,
                                                                        posts_id: params.require(:post_id)))

    respond_to do |format|
      format.html do
        if @comment.save
          flash[:success] = 'Comment created successfully'
          redirect_to user_post_path(current_user, @comment.posts)
        else
          flash.now[:error] = 'Error: Comment could not be saved'
          redirect_to new_user_post_path(current_user)
        end
      end
    end
  end
end
