class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenicate(params[:sessions][:password])
      login_user(user)
      redirect_to user
    else
      flash[:errors] = 'Invalid email/password combination'
      redirect_to session_new_path
    end
  end

  def destroy
  end
end
