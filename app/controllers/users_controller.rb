class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      flash[:success] = "Welcome #{@user.name}! Please check your email to confirm your account."
      redirect_to root_path
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to signup_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
