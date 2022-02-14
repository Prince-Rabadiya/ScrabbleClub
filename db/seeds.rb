# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do |i|
  contact_filler = i < 10 ? '000000000' : '00000000'
  Player.create(name: "player#{i}", age: 25, joining_date: Date.today, contact_number: contact_filler + i, email: "email#{i}@co.co")
end
