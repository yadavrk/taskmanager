class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome, :login, :google_create]

  def create
    @user = User.find_by(email: params[:email])
    if @user and authenticate(params[:email], params[:password])
      session[:user_id] = @user.id
      redirect_to '/projects'
    else
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
    #redirect_to login_path, notice: "Logged out!"
  end
end
