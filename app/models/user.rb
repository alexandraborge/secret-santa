class User < ApplicationRecord
  has_many :secret_santa_users, dependent: :destroy
  has_many :secret_santa_games, through: :secret_santa_users
  before_create(:default_values)
  has_one_attached(:avatar)
  has_secure_password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates(:name, presence: true)
  validates(:email, presence: true, length: { maximum: 100 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false })
  validates(:password, length: { minimum: 6 }, allow_blank: true)
  validates(:avatar, content_type: { in: %w[image/jpeg image/gif image/png], message: "must be a valid image format" }, size: { less_than: 5.megabytes, message: "should be less than 5MB" })

  def display_image
    avatar.variant(resize_to_limit: [200, 250])
  end

  def default_values
    self.summary ||= 'I love holiday games! (Use this area to tell us about yourself and your top gift preferences. Be Specific!)'
    self.avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default-avatar.jpg')), filename: 'default-avatar.jpg', content_type: 'image/jpg')
  end
end
