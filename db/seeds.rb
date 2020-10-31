# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require "activerecord-reset-pk-sequence"

ActiveRecord::Base.connection.disable_referential_integrity do
  User.delete_all
  User.reset_pk_sequence
  City.delete_all
  City.reset_pk_sequence
  Country.delete_all
  Country.reset_pk_sequence
  Article.delete_all
  Article.reset_pk_sequence
  PrivateMessage.delete_all
  PrivateMessage.reset_pk_sequence
  Bookmark.delete_all
  Bookmark.reset_pk_sequence
  CategoriesAssigment.delete_all
  CategoriesAssigment.reset_pk_sequence
  Category.delete_all
  Category.reset_pk_sequence
  Comment.delete_all
  Comment.reset_pk_sequence
end

######## - COUNTRIES - #########

10.times do
  Country.create!(
    name: Faker::Address.country
  )
end

######## - CITIES - #########

80.times do
  City.create!(
    name: Faker::Address.city,
    country_id: Country.ids.sample
  )
end

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

######## - ARTICLES - #########

200.times do
  Article.create!(
    user_id: User.ids.sample,
    title: Faker::Company.catch_phrase,
    content: Faker::Lorem.paragraph_by_chars(number: 2300, supplemental: false)
  )
end

######## - BOOKMARKS - #########

100.times do
  Bookmark.create!(
    user_id: User.ids.sample,
    article_id: Article.ids.sample
  )
end

######## - CATEGORIES - #########

20.times do
  Category.create!(
    name: Faker::Book.genre
  )
end

######## - CATEGORIES_ASSIGMENTS - #########

Article.ids.each do |id|
  rand(1..3).times do
    CategoriesAssigment.create!(
      article_id: id,
      category_id: Category.ids.sample
    )
  end
end

######## - COMMENTS - #########

250.times do
  Comment.create!(
    user_id: User.ids.sample,
    article_id: Article.ids.sample,
    content: Faker::Movie.quote
  )
end

######## - PRIVATES_MESSAGES - #########

200.times do
  PrivateMessage.create!(
    sender: User.ids.sample,
    content: Faker::Hipster.paragraph
  )
end

######## - PRIVATES_MESSAGES ASSIGMENTS - #########

200.times do
  PmAssigment.create!(
    private_message_id: PrivateMessage.ids.sample,
    recipient: User.all.sample
  )
end

######## - ARTICLE_LIKES - #########

300.times do
  ArticleLike.create!(
    article_id: Article.ids.sample,
    user_id: User.ids.sample
  )
end

######## - COMMENT_LIKES - #########

150.times do
  CommentLike.create!(
    comment_id: Comment.ids.sample,
    user_id: User.ids.sample
  )
end
