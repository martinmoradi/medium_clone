class Article < ApplicationRecord
  belongs_to :user
  has_many :bookmarks
  has_many :comments, dependent: :destroy
  has_many :categories_assigments
  has_many :categories, through: :categories_assigments
  validates :title, presence: true, length: { in: 3..30 }
  validates :content, presence: true
end
