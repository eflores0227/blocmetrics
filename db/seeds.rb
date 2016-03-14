# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

10.times do
  RegisteredApplication.create!(
  name: Faker::App.name,
  url: Faker::Internet.url
  )
end
registered_application = RegisteredApplication.all


1000.times do
  Event.create!(
    name: Faker::Superhero.name,
    registered_application_id: RegisteredApplication.all.sample.id
  )
end
events = Event.all

puts "Seed finished"
puts "#{RegisteredApplication.count} posts created"
puts "#{Event.count} events created"
