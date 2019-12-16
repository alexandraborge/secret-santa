class SecretSantaGame < ApplicationRecord
  has_many :secret_santa_users, dependent: :destroy
  has_many :users, through: :secret_santa_users
  before_create(:set_auth_token)
  
  def set_auth_token
    self.token = SecureRandom.uuid
  end
end
