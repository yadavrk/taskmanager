class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    user = user_params
    name = user[:name]
    email = user[:email]
    password = user[:password]
    password_digest = BCrypt::Password.create password
    @user = User.create(name: name, email: email, password_digest: password_digest)
    session[:user_id] = @user.id
    redirect_to '/projects'
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
