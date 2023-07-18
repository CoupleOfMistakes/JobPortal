class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 40 }, format: { with: /\A[A-Za-z]+(-[A-Za-z]+)*\z/ }
end
