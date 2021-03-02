class Rating < ApplicationRecord
  belongs_to :post
  belongs_to :topic
  validates :rate, presence: true
end
