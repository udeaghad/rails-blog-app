class CommentsController < ApplicationController
  before_action :authenticate_user!
  def new
    @comment = Comment.new
    respond_to do |format|
      format.html { render :new, locals: { comment: @comment } }
    end
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = post_params

    respond_to do |format|
      format.html do
        if @comment.save
          flash[:success] = 'Comment created successfully'
          redirect_to user_post_path(current_user, @comment.post)
        else
          flash.now[:error] = 'Error: Comment could not be saved'
          redirect_to new_user_post_path(current_user)
        end
      end
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end
  
  def update
    @comment = Comment.find(params[:id])
      if @comment.update(comment_params)
        flash[:success] = "Object was successfully updated"
        redirect_to user_post_path(@comment.user_id, @comment.post)
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end

  def destroy
    @comment = Comment.includes(:post).find(params[:id])
    @comment.post.decrement!(:comments_counter)
    if @comment.destroy
      flash[:success] = 'Object was successfully deleted.'
      redirect_to user_post_path(@comment.user_id, @comment.post_id)
    else
      flash[:error] = 'Something went wrong'
      redirect_to user_post_path(@comment.user_id, @comment.post_id)
    end
  end
  
  

  private

  def comment_params
    params.require(:comment).permit(:text)
  end

  def post_params
    params.require(:post_id)
  end
end
