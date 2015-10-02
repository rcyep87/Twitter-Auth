class SessionsController <  ApplicationController
  skip_before_filter :authenticate_user

  def new #login page
  end

  def create #create the login session

  end

  def destroy #delete the login session
  end

  private

  def set_user_session(user) #places temporary cookie on user's browser
    session[:logged_in_user] = user.id
  end
end
