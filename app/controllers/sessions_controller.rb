class SessionsController < ApplicationController
  helper_method(:logged_in?, :current_user)

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      login(user)
      redirect_to user
    else
      flash[:errors] = 'Invalid email/password combination'
      redirect_to login_path
    end
  end

  def destroy
    logout
    redirect_to root_url
  end
end
