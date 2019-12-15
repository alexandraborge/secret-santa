module UsersHelper
  def my_games
    @user.secret_santa_games
  end

  def is_creator?(game)
    game[:creator] == current_user[:id]
  end

  def user_game_gift_receiver(game)
    gift_receiver = SecretSantaUser.all.find { |user| user.user_id == @user.id && user.secret_santa_game_id == game.id }[:gift_receiver]
    return if gift_receiver.nil?

    User.find(gift_receiver).name
  end
end
