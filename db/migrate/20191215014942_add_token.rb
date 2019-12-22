class AddToken < ActiveRecord::Migration[6.0]
  def change
    add_column :secret_santa_games, :token, :string
  end
end
