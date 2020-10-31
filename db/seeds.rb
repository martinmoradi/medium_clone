# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'activerecord-reset-pk-sequence'

ActiveRecord::Base.connection.disable_referential_integrity do
  User.delete_all
  User.reset_pk_sequence
  City.delete_all
  City.reset_pk_sequence
  Country.delete_all
  Country.reset_pk_sequence
  Article.delete_all
  Article.reset_pk_sequence
  Message.delete_all
  Message.reset_pk_sequence
  Bookmark.delete_all
  Bookmark.reset_pk_sequence
  CategoriesAssigment.delete_all
  CategoriesAssigment.reset_pk_sequence
  Category.delete_all
  Category.reset_pk_sequence
  Comment.delete_all
  Comment.reset_pk_sequence
  puts 'DB cleaned up !'
end

######## - COUNTRIES - #########

10.times do
  Country.create!(
    name: Faker::Address.country
  )
end
puts 'Countries created = 10'

######## - CITIES - #########

80.times do
  City.create!(
    name: Faker::Address.city,
    country_id: Country.ids.sample
  )
end
puts 'Cities created = 80'

######## - USERS - #########

500.times do
  User.create!(
    pseudo: Faker::Internet.username,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.unique.free_email,
    city_id: City.ids.sample,
    password: Faker::Internet.password(min_length: 6),
    age: Faker::Number.between(from: 10, to: 120),
    description: Faker::GreekPhilosophers.quote
  )
end
puts 'Users created = 500'

######## - ARTICLES - #########

200.times do
  Article.create!(
    user_id: User.ids.sample,
    title: Faker::Company.catch_phrase,
    content: Faker::Lorem.paragraph_by_chars(number: 2300, supplemental: false)
  )
end
puts 'Articles created = 200'

######## - BOOKMARKS - #########

100.times do
  Bookmark.create!(
    user_id: User.ids.sample,
    article_id: Article.ids.sample
  )
end
puts 'Bookmarks created = 100'

######## - CATEGORIES - #########

20.times do
  Category.create!(
    name: Faker::Book.genre
  )
end
puts 'Categories created = 20'

######## - CATEGORIES_ASSIGMENTS - #########

Article.ids.each do |id|
  rand(1..3).times do
    CategoriesAssigment.create!(
      article_id: id,
      category_id: Category.ids.sample
    )
  end
end
puts 'Categories Assigments created = from 1 to 3 per Article'

######## - COMMENTS - #########

250.times do
  Comment.create!(
    user_id: User.ids.sample,
    article_id: Article.ids.sample,
    content: Faker::Movie.quote
  )
end
puts 'Comments created = 250'

######## - PRIVATES_MESSAGES - #########

200.times do
  Message.create!(
    sender_id: User.ids.sample,
    recipient_id: User.ids.sample,
    content: Faker::Hipster.paragraph
  )
end
puts 'Privates Messages created = 200'

######## - ARTICLE_LIKES - #########

300.times do
  ArticleLike.create!(
    article_id: Article.ids.sample,
    user_id: User.ids.sample
  )
end
puts 'Likes on Articles created = 300'

######## - COMMENT_LIKES - #########

150.times do
  CommentLike.create!(
    comment_id: Comment.ids.sample,
    user_id: User.ids.sample
  )
end
puts 'Likes on Comments created = 150'
