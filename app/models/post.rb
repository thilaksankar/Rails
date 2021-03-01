class Post < ApplicationRecord
  belongs_to :topic
  has_many :comments, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :taggings
  has_many :tags, through: :taggings
  validates :content, presence: true, length: { minimum:10 }
  def blank_stars
    5 - rating.to_i
  end
end
