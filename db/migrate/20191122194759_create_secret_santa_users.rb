class CreateSecretSantaUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :secret_santa_users do |t|
      t.integer :user_id
      t.integer :secret_santa_game_id
      t.integer :gift_receiver

      t.timestamps
    end
  end
end
