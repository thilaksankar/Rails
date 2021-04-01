class Post < ApplicationRecord
  belongs_to :topic
  has_many :comments, dependent: :destroy
  # has_many :opinions, class_name: "Comment", dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  validates :content, presence: true, length: { minimum:10 }
  has_one_attached :image
  # validates :image, presence: true
  belongs_to :user
  has_and_belongs_to_many :users, join_table: :post_users_read_status
  accepts_nested_attributes_for :tags
  # def tags_for_form
  #   collection = tags.where(post_id: id)
  #   collection.any? ? collection : tags.build
  # end
  paginates_per 10
end
