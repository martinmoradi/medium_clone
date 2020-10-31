class User < ApplicationRecord
  belongs_to :city
  has_many :articles
  has_many :bookmarks
  has_many :sent_messages, foreign_key: 'sender_id', class_name: 'Message'
  has_many :received_messages, foreign_key: 'recipient_id', class_name: 'Message'
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :pseudo, presence: true
  validates :email,
            format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, message: 'Email is invalid' },
            uniqueness: { case_sensitive: false },
            length: { minimum: 4, maximum: 254 }
  validates :password, presence: true, length: { minimum: 6 }
  has_secure_password
end
