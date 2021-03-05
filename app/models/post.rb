class Post < ApplicationRecord
  belongs_to :topic
  has_many :comments, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :taggings
  has_many :tags, through: :taggings
  validates :content, presence: true, length: { minimum:10 }
  has_one_attached :image
  validates :image, presence: true
end
