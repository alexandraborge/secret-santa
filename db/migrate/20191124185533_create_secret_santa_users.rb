class CreateSecretSantaUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :secret_santa_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :secret_santa_game, null: false, foreign_key: true
      t.integer :gift_receiver

      t.timestamps
    end
  end
end
