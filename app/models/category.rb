class Category < ApplicationRecord
  has_many :categories_assigments, dependent: :destroy
  has_many :articles, through: :categories_assigments
end
