class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true, length: { maximum: 40 }, format: { with: /\A[A-Za-z]+(-[A-Za-z]+)*\z/ }
  validates :lastName, presence: true, length: { maximum: 40 }, format: { with: /\A[A-Za-z]+(-[A-Za-z]+)*\z/ }
  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  # No need to validate password presence or length as has_secure_password handles it.
end