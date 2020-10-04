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
# User.create!(first_name: 'Anthony', last_name: 'You', email: 'you.anthony@yahoo.com', password: '123456', birth_date: '31/01/1995'.to_date, country: 'France', level: 'C2', description: 'Entrepreneur and Web Developer')
# User.create!(first_name: 'Nelly', last_name: 'Frisicaro', email: 'nelly.frisicaro@gmail.com', password: '123456', birth_date: '16/04/1997'.to_date, country: 'France', level: 'C2', description: 'Lead Teacher')

puts "Seeding plans..."
Plan.create!(sku: 'curieux',
             name: 'Le curieux',
             description: '- Join the French Club community
             - Access to the Slack exchange platform
             - Access to content, exchanges and advice from teachers
             - Access to weekly conversation sessions',
             stripe_id: 'prod_I8rvVEhp0RXUvs',
             stripe_price_id: 'price_1HYaC0AFmCis7vEtIie47O7d',
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
             stripe_id: 'prod_I8rxveUWsnglsv',
             stripe_price_id: 'price_1HYaDgAFmCis7vEtJ9V7ip2X',
             price_cents: 1990)
# Plan.create!(sku: 'excellent',
#              name: 'L\'excellent',
#              description: '- Join the French Club community
#              - Access to the Slack exchange platform
#              - Access to content, exchanges and advice from teachers
#              - Access to weekly conversation sessions
#              - Personalized follow-up in your progress
#              - An additional zoom session in a small group every week
#              - Access to a toolbox (mental maps, grammar cards, methodology support)
#              - A “one-on-one” session per week
#              - Personalized exercises and follow-up',
#              stripe_id: 'prod_I6eLSH81j678jV',
#              stripe_price_id: 'price_1HWR2vAFmCis7vEt236T8XeZ',
#              price_cents: 5990)

puts 'Done! 🍺'
