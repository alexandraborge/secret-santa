class SecretSantaGamesController < ApplicationController
  def new
    @secret_santa = SecretSantaGame.new
  end

  def create
    @secret_santa = SecretSantaGame.create(create_game_params)
    if @secret_santa.valid?
      flash[:success] = "#{@secret_santa.group_name}'s game of #{@secret_santa.game_title} has been created"
      redirect_to @secret_santa
    else
      flash[:errors] = @secret_santa.errors.full_messages
      redirect_to create_secret_santa_game_path
    end
  end

  def show
    @secret_santa = SecretSantaGame.find(params[:id])
    @secret_santa_user = SecretSantaUser.new
  end

  private

  def create_game_params
    params.require(:secret_santa_game).permit(:creator, :group_name, :game_title, :date_of_draw, :date_of_game, :budget)
  end  
end
