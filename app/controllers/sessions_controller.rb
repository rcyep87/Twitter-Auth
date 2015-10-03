class SessionsController <  ApplicationController
  skip_before_filter :authenticate_user

  def new #login page
  end

  def create #create the login session
    user = User.find_by_username(params[:username])
    if user.present? && user.authenticate(params[:password])
      set_user_session(user)
      redirect_to user_path(user), notice: "Successfully logged in."
    else
      flash[:alert] = "Username or Password did not match."
      render :new
    end
  end

  def destroy #delete the login session
  end

  private

  def set_user_session(user) #places temporary cookie on user's browser
    session[:logged_in_user] = user.id
  end
end
