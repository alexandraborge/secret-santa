class CreateGreedyGrabBagGames < ActiveRecord::Migration[6.0]
  def change
    create_table :greedy_grab_bag_games do |t|
      t.integer :creator
      t.string :group_name
      t.string :game_title
      t.datetime :date_of_game
      t.integer :budget

      t.timestamps
    end
  end
end
