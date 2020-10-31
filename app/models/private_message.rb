class PrivateMessage < ApplicationRecord
  validates :content, presence: true
  belongs_to :sender, class_name: 'User'
  has_many :pm_assigments
  has_many :recipients, class_name: 'User', through: :pm_assigments
end
