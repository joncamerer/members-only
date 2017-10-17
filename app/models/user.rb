class User < ApplicationRecord
  before_create :create_remember_token

  validates :name, presence: true, length: { maximum: 50 },
                   uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  has_secure_password

  def create_remember_token
    token = SecureRandom.urlsafe_base64
    self.remember_token = Digest::SHA1.hexdigest(token.to_s)
  end
end
