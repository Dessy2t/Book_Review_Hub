class Review < ApplicationRecord
  belongs_to :book
  has_rich_text :content
  validates :content, presence: true
  validates :rating, inclusion: { in: 1..5 }
  belongs_to :user
end
