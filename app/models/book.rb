class Book < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_one_attached :cover_image
  belongs_to :user
  
  validates :title, :author, presence: true
  validates :isbn, uniqueness: true, allow_nil: true
end
