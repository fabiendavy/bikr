# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  fab = User.create!(email: "davyfabien@gmail.com", password: "password", username: "bikerfab", gender: "male")
  ben = User.create!(email: "benjaminteste@gmail.com", password: "password", username: "bikerben")
  matt = User.create!(email: "mguillermit@gmail.com", password: "password", username: "bikermat", gender: "male")
  nico = User.create!(email: "nicolas.lebot@yahoo.fr", password: "password", username: "bikernico")
