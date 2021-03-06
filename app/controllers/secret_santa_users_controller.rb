class SecretSantaUsersController < ApplicationController  
  def start_draw
    players = SecretSantaUser.all.select do |s| 
      s[:secret_santa_game_id] == secret_santa_user_game_params
    end
    receivers = players.dup.map(&:user_id)

    players.each do |player|
      gift_receiver = receivers.sample

      while gift_receiver == player.user_id
        gift_receiver = receivers.sample
      end
      player.update(gift_receiver: gift_receiver)

      receivers = receivers - [gift_receiver]
    end

    flash[:success] = 'The players have been assigned!'
    redirect_to "#{secret_santa_games_path}/#{secret_santa_user_game_params}"
  end
  
  private

  def user_games_params
    params.require(:secret_santa_user).permit(:user_id, :secret_santa_game_id, :gift_receiver)
  end 

  def secret_santa_user_game_params
    params[:game_id].to_i
  end
end
