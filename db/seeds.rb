# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require "faker"

User.create(email: "dev@email.com", password: "password")

10.times do
  user = User.create(email: Faker::Internet.email, password: "password")
end

10.times do
  motorbike = Motorbike.new(name: Faker::Ancient.titan, make: Faker::Vehicle.make, model: Faker::Vehicle.model, year: Faker::Vehicle.year, description: Faker::Vehicle.standard_specs, address: Faker::Address.full_address, price: Faker::Number.within(range: 50..500))
  motorbike.user = User.all.sample
  motorbike.save!
end
