# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Destroying all instances..."
User.destroy_all

puts "Seeding users..."
User.create!(first_name: 'Anthony', last_name: 'You', email: 'you.anthony@yahoo.com', password: '123456', birth_date: '01/31/1995'.to_date, country: 'France', level: 'C2', description: 'Entrepreneur and Web Developer')
User.create!(first_name: 'Nelly', last_name: 'Frisicaro', email: 'nelly.frisicaro@gmail.com', password: '123456', birth_date: '04/16/1997'.to_date, country: 'France', level: 'C2', description: 'Lead Teacher')

puts "Seeding plans..."
