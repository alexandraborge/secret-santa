class ApplicationController < ActionController::Base
  helper_method(:logged_in?, :current_user, :logout, :login, :settings_path, :current_user?, :player_of_game?)

  private

  def login(user)
    session[:user_id] = user.id
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def logged_in?
    current_user.present?
  end

  def logout
    session.delete(:user_id)
    @current_user = nil
  end

  def settings_path
    return if @user.blank?
    "/users/#{@user.id}/settings"
  end

  def current_user?(user)
    user && user == current_user
  end
end
