class SecretSantaGame < ApplicationRecord
  has_many :secret_santa_users
  has_many :users, through: :secret_santa_users
end
