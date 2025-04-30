class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true ,uniqueness: { case_sensitive: false }
  normalizes :email, ->(email){email.strip.downcase}
  def email=(value)
    super(value.strip.downcase)
  end
end
