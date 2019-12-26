class ApplicationController < ActionController::Base
  before_action :authorized
  helper_method :current_user
  helper_method :logged_in?

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
  !current_user.nil?
  end

  def authorized
    redirect_to '/welcome' unless logged_in?
  end

  def authenticate(email, password)
    user = User.find_by_email(email)
    BCrypt::Password.new(user.password_digest).is_password?(password)
  end
end
