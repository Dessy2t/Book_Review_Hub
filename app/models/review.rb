class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user

  has_rich_text :content
  
  validates :content, presence: true
  validates :rating, inclusion: { in: 1..5 }
end
