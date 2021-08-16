# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

catego = ["chinese", "italian", "japanese", "french", "belgian"]

puts "Eliminando toda la base de datos:"
Restaurant.destroy_all
Review.destroy_all

10.times do
  bristol = Restaurant.new(name: Faker::Restaurant.name , category: catego.sample, phone_number: Faker::PhoneNumber.extension, address: Faker::Address.city)
  bristol.save                # Insert into DB and set id
  yummy = Review.new(content: Faker::Quote.yoda, rating: rand(0..5))
  yummy.restaurant = bristol  # Set foreign key restaurant_id
  yummy.save
  bristol.reviews             # Should contain the yummy review
  yummy.restaurant
end
