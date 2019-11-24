module UsersHelper
  def my_games
    @user.secret_santa_games
  end

  def is_creator?(game)
    game[:creator] == current_user[:id]
  end
end
