class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article
  has_many :comment_likes, dependent: :destroy
  validates :content, presence: true
end
