# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'date'

User.destroy_all
Bike.destroy_all
Booking.destroy_all

fab = User.create!(email: "davyfabien@gmail.com", password: "password", username: "bikerfab", gender: "male", location: "142 rue Gambetta, 92150 Suresnes")
ben = User.create!(email: "benjamin.teste@gmail.com", password: "password", username: "bikerben", location: "8 rue des Frères Chausson, 92600 Asnières")
matt = User.create!(email: "mguillermit@gmail.com", password: "password", username: "bikermat", gender: "male", location: "88 rue Bonaparte, 75006 Paris")
nico = User.create!(email: "nicolas.lebot@yahoo.fr", password: "password", username: "bikernico", location: "60 rue La Condamine, 75017 Paris")

users = [fab, ben, matt, nico]

users.each do |user|
  3.times do
    Bike.create!(bike_type: Bike::BIKE_TYPES.sample, location: user.location, price_per_day: rand(10..60), description: Faker::Lorem.paragraph(sentence_count: 5), user: user)
  end
end

booking1 = Booking.new(user_id: 1, bike_id: 1, start_date: Date.today(), end_date: Date.today() +  5)
booking2 = Booking.new(user_id: 2, bike_id: 6, start_date: Date.today() + 1, end_date: Date.today() +  4)
booking3 = Booking.new(user_id: 3, bike_id: 9, start_date: Date.today() + 2, end_date: Date.today() +  5)
