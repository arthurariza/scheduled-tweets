class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true
  validates :password, :password_confirmation, presence: true, length: { minimum: 6 }
end
