class Post < ApplicationRecord
  belongs_to :topic
  validates :content, presence: true, length: { minimum:10 }
end
