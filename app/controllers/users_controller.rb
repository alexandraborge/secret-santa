class UsersController < ApplicationController
  before_action(:authorized_user, only: [:show, :edit, :update, :delete])

  def new
    @user = User.new
  end

  def create
    @user = User.create(create_user_params)
    if @user.valid?
      login(@user)
      @user.secret_santa_users.create(user_id: @user.id, secret_santa_game_id: SecretSantaGame.find_by(token: params[:user][:token]).id) if params[:user][:token].present?
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
    @user.avatar.attach(params[:avatar]) if @user.avatar.blank?
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
    flash[:success] = 'Your account has been deleted'
    redirect_to root_url
  end

  private

  def create_user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar, :summary)
  end

  def authorized_user
    @user = User.find(params[:id])
    redirect_to login_path unless logged_in? && current_user?(@user)
  end
end
