class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(create_user_params)
    if @user.valid?
      login(@user)
      flash[:success] = "Welcome #{@user.name}! Start by customizing your profile!"
      redirect_to @user
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to signup_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.avatar.attach(params[:avatar])
    if @user.update(create_user_params)
      flash[:success] = "Profile Updated!"
      redirect_to @user
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to edit_user_path
    end
  end

  private

  def create_user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar, :summary)
  end
end
