# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

5.times do |user|
  User.create(email: Faker::Internet.email, password: "password",
        password_confirmation: "password", first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name)
end

  # My test user easy to remmeber
  User.create(email: "a@a.com", password: "12345678",
        password_confirmation: "12345678", first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name)

puts "6 users created"

100.times do |post|
  Post.create!(date: Faker::Date.between(1.year.ago, Date.today),
               rationale: Faker::Hipster.paragraph(3, false, 2),
               user_id: User.order("RANDOM()").first.id )
end

puts "100 posts have been created"
