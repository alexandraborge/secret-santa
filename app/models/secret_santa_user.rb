class SecretSantaUser < ApplicationRecord
  belongs_to :user
  belongs_to :secret_santa_game
end
