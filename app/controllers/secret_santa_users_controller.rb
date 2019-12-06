class SecretSantaUsersController < ApplicationController  
  def create
    @secret_santa_user = SecretSantaUser.create(user_games_params)
    if @secret_santa_user.valid?
      flash[:success] = 'Congrats! You have been added to the game!'
      redirect_to "#{secret_santa_games_path}/#{@secret_santa_user.secret_santa_game_id}"
    else
      redirect_to "#{secret_santa_games_path}/#{@secret_santa_user.secret_santa_game_id}"
    end
  end

  # Update records by adding a value to the gift receiver column
  def start_draw
    players = SecretSantaUser.all.select { |s| s[:secret_santa_game_id] == params[:id] }
    receivers = players
    players = players.each do |player|
      pick = receivers.sample
      if pick != player
        player.update({gift_receiver: player.user_id})
      else
        while pick == player
          if pick != player
            player.update({gift_receiver: player.user_id})
          else
            pick = receivers.sample
          end
        end
      end
      receivers = receivers - [pick]
    end

    flash[:success] = 'The players have been assigned!'
    redirect_to "#{secret_santa_games_path}/#{@secret_santa_user.secret_santa_game_id}"
  end
  
  private

  def user_games_params
    params.require(:secret_santa_user).permit(:user_id, :secret_santa_game_id, :gift_receiver)
  end 
end
