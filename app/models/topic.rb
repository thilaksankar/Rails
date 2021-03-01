class Topic < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :ratings, dependent: :destroy
  validates :title, presence: true
  validates :post, presence: true, length: { minimum: 10 }
end
