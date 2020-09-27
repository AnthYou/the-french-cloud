# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Destroying all instances..."
User.destroy_all
Plan.destroy_all

puts "Seeding users..."
User.create!(first_name: 'Anthony', last_name: 'You', email: 'you.anthony@yahoo.com', password: '123456', birth_date: '31/01/1995'.to_date, country: 'France', level: 'C2', description: 'Entrepreneur and Web Developer')
User.create!(first_name: 'Nelly', last_name: 'Frisicaro', email: 'nelly.frisicaro@gmail.com', password: '123456', birth_date: '16/04/1997'.to_date, country: 'France', level: 'C2', description: 'Lead Teacher')

puts "Seeding plans..."
Plan.create!(sku: 'curieux',
             name: 'Le curieux',
             description: '- Join the French Club community
             - Access to the Slack exchange platform
             - Access to content, exchanges and advice from teachers
             - Access to weekly conversation sessions',
             price_cents: 990)
Plan.create!(sku: 'ptit-french',
             name: 'Le p\'tit French',
             description: '- Join the French Club community
             - Access to the Slack exchange platform
             - Access to content, exchanges and advice from teachers
             - Access to weekly conversation sessions
             - Personalized follow-up in your progress
             - An additional zoom session in a small group every week
             - Access to a toolbox (mental maps, grammar cards, methodology support)',
             price_cents: 1490)
Plan.create!(sku: 'excellent',
             name: 'L\'excellent',
             description: '- Join the French Club community
             - Access to the Slack exchange platform
             - Access to content, exchanges and advice from teachers
             - Access to weekly conversation sessions
             - Personalized follow-up in your progress
             - An additional zoom session in a small group every week
             - Access to a toolbox (mental maps, grammar cards, methodology support)
             - A “one-on-one” session per week
             - Personalized exercises and follow-up',
             price_cents: 5990)

puts 'Done! 🍺'
