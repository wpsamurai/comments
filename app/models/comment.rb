class Comment < ApplicationRecord
  belongs_to :post

  validates :post_id, presence: true
  validates :name, presence: true
  validates :email, presence: true
end
