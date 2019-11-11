class UsersController < ApplicationController
  # For now only allow the logged in current user to view, update, delete their profile
  # Later, anyone in a game with the person will be able to view their profile
  before_action(:correct_user, only: [:show, :edit, :update, :delete])

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

  def settings
    @user = User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = 'User Deleted'
    redirect_to root_url
  end

  private

  def create_user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar, :summary)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to root_url unless current_user?(@user)
  end
end
