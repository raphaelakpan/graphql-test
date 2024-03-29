class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password_confirmation, presence: true, if: proc { password.present? }
end
