class SecretSantaUsersController < ApplicationController
  def create
    @secret_santa_user = SecretSantaUser.create(user_games_params)
    if @secret_santa_user.valid?
      flash[:success] = 'Congrats! You have been added to the game!'
      redirect_to "#{secret_santa_games_path}/#{@secret_santa_user.secret_santa_game_id}"
    else
      flash[:errors] = 'Oops'
      redirect_to "#{secret_santa_games_path}/#{@secret_santa_user.secret_santa_game_id}"
    end
  end
  
  private

  def user_games_params
    params.require(:secret_santa_user).permit(:user_id, :secret_santa_game_id, :gift_receiver)
  end 
end
