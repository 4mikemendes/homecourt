# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require "open-uri"
User.destroy_all

50.times do
  file = URI.open('https://source.unsplash.com/search/photos?query=tennis-court')
  user = User.new(
    email: Faker::Internet.email,
    password: "123456",
    updated_at: Faker::Date.in_date_period,
    description: Faker::TvShows::RickAndMorty.quote,
    ranking: Faker::Alphanumeric.alpha(number: 5)
    )
    user.profile_picture.attach(io: file, filename: "name.jpg")
    user.save!

end

50.times do
    file = URI.open('https://source.unsplash.com/random')
  tennis_court = TennisCourt.create!(
    user: User.first,
    court_name: Faker::Books::Dune.planet,
    address: Faker::Address.city,
    price_per_hour: Faker::Number.number(digits: 2),
    description: Faker::TvShows::DrWho.quote,
    surface_type: Faker::TvShows::DrWho.quote,
    )
   tennis_court.photo.attach(io: file, filename: "name.jpg")
    tennis_court.save!
end

