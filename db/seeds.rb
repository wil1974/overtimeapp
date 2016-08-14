# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

100.times do |post|
  Post.create!(date: Faker::Date.between(1.year.ago, Date.today),
               rationale: Faker::Hipster.paragraph(3, false, 2) )
end

puts "100 posts have been created"
