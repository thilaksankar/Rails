class Post < ApplicationRecord
  belongs_to :topic
  has_many :comments, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  validates :content, presence: true, length: { minimum:10 }
  has_one_attached :image
  validates :image, presence: true
  belongs_to :user
  def all_tags=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(tag: name).first_or_create!
    end
  end
  def all_tags
    tags.map(&:tag).join(", ")
  end
end
