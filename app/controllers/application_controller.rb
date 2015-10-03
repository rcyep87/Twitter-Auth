class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user

  def authenticate_user
    unless user_logged_in?
      redirect_to new_login_path
    end
  end

  def current_user #enables retrieval of a user's session cookie as they visit different pages (from set_user_session)
    if user_logged_in?
      User.find(session[:logged_in_user])
    end
  end

  def user_logged_in? # tests to see if newly registered user is logged in
    session[:logged_in_user].present?
  end
  helper_method :user_logged_in?
end
