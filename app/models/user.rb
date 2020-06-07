class User < ApplicationRecord
  has_many :posts

  validates :name, presence: true, length: { maximum: 3 }
  validates :username, presence: true
  validates :email, presence: true
end
