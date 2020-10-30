class Category < ApplicationRecord
  has_many :categories_assigments, dependant: :destroy
  has_many :articles, through: :categories_assigments
end
