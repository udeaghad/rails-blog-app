class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user_posts = User.find(params[:id])    
  end

  def new; end
end
