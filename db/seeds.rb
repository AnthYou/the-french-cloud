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
Checkout.destroy_all
Lesson.destroy_all

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

puts "Seeding lessons..."
Lesson.create!(sku: "present-indicatif",
               title: "Le présent de l'indicatif",
               level: "A1",
               description_en: "Le présent is one of the most frequently used tenses in the French language. It corresponds to the English simple present, and we use it to talk about facts, current situations, and repeated actions, as well as scheduled future actions. To conjugate a verb in the present tense, we add specific endings to the infinitive of the verb depending on whether it ends in -er, -ir or -re.",
               description_fr: "Le présent est l'un des temps les plus utilisés dans la langue française. Il correspond au présent simple anglais, et nous l'utilisons pour parler de faits, de situations actuelles, et d'actions répétées, ainsi que d'actions futures programmées. Pour conjuguer un verbe au présent, nous ajoutons des terminaisons spécifiques à l'infinitif du verbe selon qu'il se termine par -er, -ir ou -re.")
Lesson.create!(sku: "imparfait",
               title: "L'imparfait",
               level: "A2",
               description_en: "The Imparfait tense is used to describe past descriptions, or habitual actions in the past.",
               description_fr: "Le temps de l'imparfait est utilisé pour décrire des descriptions du passé, ou des actions habituelles dans le passé.")
Lesson.create!(sku: "passe-compose",
               title: "Le passé composé",
               level: "A2",
               description_en: "The passé composé is the most commonly used tense to refer to actions completed in the past. The action is precise and complete.\nThis tense is called the passé composé because it is composed of two elements: the auxiliary verbs avoir or être followed by the past participle (le participe passé) of the verb.",
               description_fr: "Le passé composé est le temps le plus couramment utilisé pour désigner les actions réalisées dans le passé. L'action est précise et complète.\nCe temps est appelé \"passé composé\" parce qu'il est composé de deux éléments: les verbes auxiliaires « être » ou « avoir » suivis du participe passé du verbe.")

puts 'Done! 🍺'
