class User < ApplicationRecord
  has_one_attached(:avatar)
  has_secure_password
  has_rich_text :content
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates(:name, presence: true)
  validates(:email, presence: true, length: { maximum: 100 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false })
  validates(:password, presence: true, length: { minimum: 6 })
  validates(:avatar, content_type: { in: %w[image/jpeg image/gif image/png], message: "must be a valid image format" }, size: { less_than: 5.megabytes, message: "should be less than 5MB" })

  def display_image
    avatar.variant(resize_to_limit: [200, 250])
  end
end
