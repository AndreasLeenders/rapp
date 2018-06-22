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
  user.save!

  band = Band.new(
    user_id: user.id,
    name: Faker::RockBand.name,
    content: Faker::StarWars.quote,
    pictures: ["https://i.pinimg.com/originals/70/51/80/7051808b359b3fa1a96040193ea7c4ef.jpg","https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Arena_%28band%29.jpg/1200px-Arena_%28band%29.jpg", "http://iceagecopenhagen.eu/images/bandphoto.jpg", "http://mediad.publicbroadcasting.net/p/ketr/files/styles/x_large/public/201706/The_Band_of_Heathens_Credit-Greg-Giannukos-1.jpg"].sample,
    soundcloud: rand(200000000..300000000),
    location: Faker::Address.full_address,
    )
  band.save!
end

puts "bands created"

puts "creating events"
10.times do
  neg1 = rand(0..1)
  neg2 = rand(0..1)

  event = Event.new(
    organiser_id: Organiser.all.sample.id,
    name: Faker::Coffee.blend_name,
    date_begin: DateTime.new(2018,3,7),
    date_end: DateTime.new(2018,3,10),
    capacity: rand(10..1000),
    equipment: ['everything', 'some', 'none'].sample,
    price: rand(0..1000),
    commodities: ['toilets', 'none'].sample,
    city: "none",
    address: Faker::Address.full_address.downcase,
    picture: ["https://images.pexels.com/photos/154147/pexels-photo-154147.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940", "https://images.pexels.com/photos/248963/pexels-photo-248963.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940", "https://images.pexels.com/photos/167480/pexels-photo-167480.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940", "https://c.pxhere.com/photos/86/5f/concert_band_crowd_music_gig-100440.jpg!d", "https://c.pxhere.com/photos/07/b8/bar_drinks_alcohol_restaurant_pub-1205054.jpg!d"].sample
    )
  event.city = event.address.split(',').map(&:lstrip)[1].capitalize
  event.save!
end
puts "events created"

puts "creating bookings"
10.times do
  booking = Booking.new(
    band_id: Band.all.sample.id,
    event_id: Event.all.sample.id,
    status: ['pending', 'accepted', 'refused', 'cancelled'].sample,
    )
  booking.save!
end
puts "bookings created"

puts "creating sample organiser (organiser@gmail.com // pass : organiserpassword)"
    user = User.new(
    email: "organiser@gmail.com",
    password: "organiserpassword",
    is_band: false,
    is_organiser: true,
  )
    user.save!

    organiser = Organiser.new(
      user_id: user.id,
      name: Faker::TwinPeaks.character
      )
    organiser.save!

puts "done"

puts "creating sample band (band@gmail.com // pass : bandpassword)"
    user = User.new(
    email: "band@gmail.com",
    password: "bandpassword",
    is_band: true,
    is_organiser: false,
  )
    user.save!

    band = Band.new(
      user_id: user.id,
      name: Faker::RockBand.name,
      content: Faker::StarWars.quote,
      pictures: "http://igloomusic.co.uk/wp-content/uploads/2014/09/my-band.jpg",
      soundcloud: 203410014,
      location: Faker::Address.full_address
      )
    band.save!
puts "done"

puts "creating booking"

  booking = Booking.new(
        band_id: band.id,
        event_id: Event.all.sample.id,
        status: ['pending', 'accepted', 'refused', 'cancelled'].sample,
        message: "this is a message"
    )
  booking.save!

