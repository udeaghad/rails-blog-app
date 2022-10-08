class Api::V1::UsersController < ApplicationController  
  def index
    @users = User.all

    render json: {
      "user": @users
    } 
  end

  def sign_in 
    @user = User.find_by(email: user_params[email] )

    if @user && @user.authenticate(user_params[:password])
      token = encode_token({user_id: @user.id})
      render json: { user: @user, token: token}, status: :ok
    else 
      render json: { error: "Invalid email or password"}, status: :unprocessable_entity
  end
end

  
end