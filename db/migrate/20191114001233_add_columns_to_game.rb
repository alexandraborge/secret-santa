class AddColumnsToGame < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :game_title, :string
    add_column :games, :date_of_draw, :datetime
    add_column :games, :budget, :float
  end
end
