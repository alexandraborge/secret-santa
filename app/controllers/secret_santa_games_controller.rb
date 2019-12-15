class SecretSantaGamesController < ApplicationController
  before_action(:authorized_player, :show)

  def new
    @secret_santa = SecretSantaGame.new
  end

  def create
    @secret_santa = SecretSantaGame.create(create_game_params)
    if @secret_santa.valid?
      @secret_santa.secret_santa_users.create(user_id: @secret_santa.creator)
      flash[:success] = "#{@secret_santa.group_name}'s game of #{@secret_santa.game_title} has been created"
      redirect_to @secret_santa
    else
      flash[:errors] = @secret_santa.errors.full_messages
      redirect_to create_secret_santa_game_path
    end
  end

  def show
    @secret_santa = SecretSantaGame.find(params[:id])
  end

  def edit
    @secret_santa = SecretSantaGame.find(params[:id])
  end

  def update
    @secret_santa = SecretSantaGame.find(params[:id])
    if @secret_santa.update(create_game_params)
      flash[:success] = "Your game details have been updated!"
      redirect_to @secret_santa
    else
      flash[:errors] = @secret_santa.errors.full_messages
      redirect_to edit_secret_santa_path
    end
  end

  def destroy
    SecretSantaGame.find(params[:id]).destroy
    flash[:success] = 'Your game has been deleted'
    redirect_to user_path
  end

  private

  def create_game_params
    params.require(:secret_santa_game).permit(:creator, :group_name, :game_title, :date_of_draw, :date_of_game, :budget, :token)
  end

  def authorized_player
    redirect_to login_path unless logged_in? && player_of_game?
  end
end
