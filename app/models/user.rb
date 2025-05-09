class User < ApplicationRecord
  has_secure_password
  has_many :favorite_colors, dependent: :destroy

  validates :email, presence: true ,uniqueness: { case_sensitive: false }
  normalizes :email, with: ->(email) { email.strip.downcase }
  def email=(value)
    super(value.strip.downcase)
  end

  generates_token_for  :password_reset,expires_in: 15.minutes do
    password_salt&.last(10)

  end
  generates_token_for :email_confirmation,expires_in: 24.minutes do
    email
  end
end
