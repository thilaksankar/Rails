class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :topic
  validates :comment, presence: true
end
