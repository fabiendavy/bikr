# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# BIKE_TYPES = ["Mountain", "Road", "Time Trial", "Gravel Cyclocross", "BMX", "Single Speed", "Cruiser", "Urban", "Hybrid", "Touring"]


User.destroy_all
Bike.destroy_all



fab = User.create!(email: "davyfabien@gmail.com", password: "password", username: "bikerfab", gender: "male", location: "142 rue Gambetta, 92150 Suresnes")
ben = User.create!(email: "benjaminteste@gmail.com", password: "password", username: "bikerben", location: "Gare Saint-Lazare, Paris")
matt = User.create!(email: "mguillermit@gmail.com", password: "password", username: "bikermat", gender: "male", location: "88 rue Bonaparte, 75006 Paris")
nico = User.create!(email: "nicolas.lebot@yahoo.fr", password: "password", username: "bikernico", location: "60 rue La Condamine, 75017 Paris")

users = [fab, ben, matt, nico]

users.each do |user|
  3.times do
    Bike.create!(bike_type: Bike::BIKE_TYPES.sample, location: user.location, price_per_day: rand(10..60), description: Faker::Lorem.paragraph(sentence_count: 5), user: user)
  end
end
