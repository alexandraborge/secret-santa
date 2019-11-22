class GreedyGrabBagGamesController < ApplicationController
  def new
    @greedy_grab_bag = GreedyGrabBagGame.new
  end

  def create
    @greedy_grab_bag = GreedyGrabBagGame.create(create_game_params)
    if @greedy_grab_bag.valid?
      flash[:success] = "#{@greedy_grab_bag.group_name}'s game of #{@greedy_grab_bag.game_title} has been created"
      redirect_to @greedy_grab_bag
    else
      flash[:errors] = @greedy_grab_bag.errors.full_messages
      redirect_to create_greedy_grab_bag_game_path
    end
  end

  def show
    @greedy_grab_bag = GreedyGrabBagGame.find(params[:id])
  end

  private

  def create_game_params
    params.require(:greedy_grab_bag_game).permit(:creator, :group_name, :game_title, :date_of_game, :budget)
  end 
end
