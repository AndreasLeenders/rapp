# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts "creating organisers"
10.times do
    pwd = "teeest"
  user = User.new(
    email:    Faker::Internet.email,
    password: pwd,
    
    is_organiser: true,
    is_band: false,
    )
  user.save!

  organiser = Organiser.new(
    user_id: user.id,
    name: Faker::HarryPotter.character,
    )
  organiser.save!
end

puts "organisers created"


puts "creating bands"
10.times do 
  user = User.new(
    email:    Faker::Internet.email,
    password: "teeest",
    is_band: true,
    is_organiser: false,
  )
  user.save

  band = Band.new(
    user_id: user.id,
    name: Faker::RockBand.name,
    content: Faker::StarWars.quote,
    pictures: "http://igloomusic.co.uk/wp-content/uploads/2014/09/my-band.jpg",
    soundcloud: "https://soundcloud.com/deadmau5",
    location: Faker::Address.full_address,
    )
end

puts "bands created"