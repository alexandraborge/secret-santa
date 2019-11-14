class GamesController < ApplicationController
  def new
    @game = Game.new
  end

  def create
    @game = Game.create(create_game_params)
    if @game.valid?
      flash[:success] = "#{@game.name}'s game of #{@game.game_title} has been created"
      redirect_to game_path
    else
      flash[:errors] = @game.errors.full_messages
      redirect_to new_game_path
    end
  end

  def show
    @game = Game.find(params[:id])
  end
end

private

def create_game_params
  params.require(:game).permit(:name, :admin_user, :game_title, :date_of_draw, :budget)
end
