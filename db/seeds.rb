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
             description: '- Join the French Cloud community
             - Access to the Slack exchange platform
             - Access to content, exchanges and advice from teachers
             - Access to weekly conversation sessions',
             stripe_id: 'prod_I8rvVEhp0RXUvs',
             stripe_price_id: 'price_1HYaC0AFmCis7vEtIie47O7d',
             price_cents: 990)
Plan.create!(sku: 'ptit-french',
             name: 'Le p\'tit French',
             description: '- Join the French Cloud community
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
#              description: '- Join the French Cloud community
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
               category: Lesson::CATEGORIES[1],
               description_en: "Le présent is one of the most frequently used tenses in the French language. It corresponds to the English simple present, and we use it to talk about facts, current situations, and repeated actions, as well as scheduled future actions. To conjugate a verb in the present tense, we add specific endings to the infinitive of the verb depending on whether it ends in -er, -ir or -re.",
               description_fr: "Le présent est l'un des temps les plus utilisés dans la langue française. Il correspond au présent simple anglais, et nous l'utilisons pour parler de faits, de situations actuelles, et d'actions répétées, ainsi que d'actions futures programmées. Pour conjuguer un verbe au présent, nous ajoutons des terminaisons spécifiques à l'infinitif du verbe selon qu'il se termine par -er, -ir ou -re.")
Lesson.create!(sku: "imparfait",
               title: "L'imparfait",
               level: "A2",
               category: Lesson::CATEGORIES[1],
               description_en: "The Imparfait tense is used to describe past descriptions, or habitual actions in the past.",
               description_fr: "Le temps de l'imparfait est utilisé pour décrire des descriptions du passé, ou des actions habituelles dans le passé.")
Lesson.create!(sku: "passe-compose",
               title: "Le passé composé",
               level: "A2",
               category: Lesson::CATEGORIES[1],
               description_en: "The passé composé is the most commonly used tense to refer to actions completed in the past. The action is precise and complete.\nThis tense is called the passé composé because it is composed of two elements: the auxiliary verbs avoir or être followed by the past participle (le participe passé) of the verb.",
               description_fr: "Le passé composé est le temps le plus couramment utilisé pour désigner les actions réalisées dans le passé. L'action est précise et complète.\nCe temps est appelé \"passé composé\" parce qu'il est composé de deux éléments: les verbes auxiliaires « être » ou « avoir » suivis du participe passé du verbe.")
Lesson.create!(sku: "se-presenter",
               title: "Se présenter",
               level: "A1",
               category: Lesson::CATEGORIES[2],
               description_en: "Knowing how to talk about yourself is essential to being able to communicate with others. In this lesson, you will find the basics to introduce yourself. Don't hesitate to listen to the audio files to work on pronunciation.",
               description_fr: "Savoir parler de toi est essentiel pour pouvoir communiquer avec les autres. Tu trouveras, dans cette leçon les bases pour te présenter. N'hésite pas à écouter les fichiers audios pour travailler la prononciation.")
Lesson.create!(sku: "passe-compose-imparfait",
               title: "Passé composé ou imparfait ?",
               level: "A2",
               category: Lesson::CATEGORIES[1],
               description_en: "When we want to talk about an event in the past tense, it is sometimes difficult to choose between imparfait or passé composé. Thanks to these tips, you can learn how to choose easily between these two tenses.",
               description_fr: "Quand on veut parler d'un événement au passé, il est parfois difficile de choisir entre imparfait ou passé composé. Grâce à ces quelques petites astuces, tu peux apprendre à choisir facilement entre ces deux temps.")
Lesson.create!(sku: "demander-chemin",
               title: "Demander son chemin",
               level: "A2",
               category: Lesson::CATEGORIES[2],
               description_en: "You are lost, your phone has no battery and you have no sense of orientation? You will have to ask a passer-by for directions. Don't panic, here is a practical guide to help you, with all the necessary vocabulary and an example with audio.",
               description_fr: "Vous êtes perdu, votre portable n’a plus de batterie et vous n’avez pas le sens de l’orientation ? Il va falloir demander votre chemin à un passant. Pas de panique, voici un guide pratique pour vous aider, avec tout le vocabulaire nécessaire et un exemple avec son audio.")
Lesson.create!(sku: "rencontre-bar",
               title: "Première rencontre au bar",
               level: "A2",
               category: Lesson::CATEGORIES[2],
               description_en: "Has it ever happened to you to meet someone but not be able to speak French? How do you approach someone for the first time? What do you order to drink in a bar in France?",
               description_fr: "Est-ce que ça t'est déjà arrivé de rencontrer quelqu'un mais de ne pas arriver à parler en français ? Comment aborder quelqu'un pour la première fois ? Qu'est-ce que tu commandes à boire dans un bar en France ?")
Lesson.create!(sku: "arrivee-paris",
               title: "L'arrivée à Paris",
               level: "A2",
               category: Lesson::CATEGORIES[2],
               description_en: "Arriving in Paris is an unforgettable moment (especially the first time) but it can be quickly spoiled by the stress of getting around and communicating with others. Here are some sentences and information that can save you!",
               description_fr: "L'arrivée en Paris est un moment inoubliable (surtout la première fois) mais il peut être vite gâché par le stress de se déplacer et de communiquer. Voici quelques phrases et informations qui peuvent te sauver !")
Lesson.create!(sku: "restaurant",
               title: "Au restaurant",
               level: "A2",
               category: Lesson::CATEGORIES[2],
               description_en: "If you come to France, enjoy the local gastronomy! The French cuisine is very varied with many influences. But for this, you will have to order at the restaurant. It's not always easy when the waiters are in a hurry with a lot of noise, right?",
               description_fr: "Si tu viens en France, profite-en pour goûter la gastronomie locale ! La cuisine française est très variée, elle se nourrit de beaucoup d'influences. Mais pour cela, il te faudra commander au restaurant. Ce n’est pas toujours évident quand les serveurs sont pressés et qu'il y a beaucoup de bruit pas vrai ?")

puts "Seeding exercises..."
ex1 = Exercise.create!(sku: "champs-elysees",
                       title: "Les Champs-Elysées",
                       level: "A1",
                       category: Exercise::CATEGORIES[0])
ex1q1 = Question.create!(prompt: "Qu'est-ce qu'on peut acheter dans les magasins de souvenirs ?",
                      exercise: ex1)
Answer.create!(content: "Des magnets",
               question: ex1q1,
               is_correct: true)
Answer.create!(content: "Des baguettes",
               question: ex1q1,
               is_correct: false)
Answer.create!(content: "Des livres sur Paris",
               question: ex1q1,
               is_correct: false)
ex1q2 = Question.create!(prompt: "Sur les Champs-Elysées, il y a de la richesse et de la pauvreté.",
                      exercise: ex1)
Answer.create!(content: "Vrai",
               question: ex1q2,
               is_correct: true)
Answer.create!(content: "Faux",
               question: ex1q2,
               is_correct: false)
ex1q3 = Question.create!(prompt: "Quelle est la spécialité du restaurant ?",
                      exercise: ex1)
Answer.create!(content: "Le Roquefort",
               question: ex1q3,
               is_correct: false)
Answer.create!(content: "Les pâtisseries",
               question: ex1q3,
               is_correct: false)
Answer.create!(content: "Les moules frites",
               question: ex1q3,
               is_correct: true)
ex1q4 = Question.create!(prompt: "Comment s'appelle le dessert ?",
                      exercise: ex1)
Answer.create!(content: "La crème brûlée",
               question: ex1q4,
               is_correct: true)
Answer.create!(content: "Le Roquefort",
               question: ex1q4,
               is_correct: false)
Answer.create!(content: "Le croissant",
               question: ex1q4,
               is_correct: false)
ex2 = Exercise.create!(sku: "canal-stmartin",
                       title: "Le Canal Saint-Martin",
                       level: "A2",
                       category: Exercise::CATEGORIES[0])
ex2q1 = Question.create!(prompt: "Combien de temps dure le trajet en métro ?",
                      exercise: ex2)
Answer.create!(content: "2 minutes",
               question: ex2q1,
               is_correct: false)
Answer.create!(content: "10 minutes",
               question: ex2q1,
               is_correct: false)
Answer.create!(content: "20 minutes",
               question: ex2q1,
               is_correct: true)
ex2q2 = Question.create!(prompt: "Où se trouvent les Pyrénées ?",
                      exercise: ex2)
Answer.create!(content: "En France",
               question: ex2q2,
               is_correct: false)
Answer.create!(content: "En Espagne",
               question: ex2q2,
               is_correct: false)
Answer.create!(content: "A la frontière entre la France et l'Espagne",
               question: ex2q2,
               is_correct: true)
ex2q3 = Question.create!(prompt: "Quelle est ma photo préférée ?",
                      exercise: ex2)
Answer.create!(content: "Le couple à la fenêtre qui applaudit",
               question: ex2q3,
               is_correct: true)
Answer.create!(content: "La fille qui fait du roller",
               question: ex2q3,
               is_correct: false)
Answer.create!(content: "L'homme avec le drapeau français",
               question: ex2q3,
               is_correct: false)
ex2q4 = Question.create!(prompt: "Que se passe-t-il sur la Place de la République ?",
                      exercise: ex2)
Answer.create!(content: "Il y a des expositions",
               question: ex2q4,
               is_correct: false)
Answer.create!(content: "Il y a des manifestations",
               question: ex2q4,
               is_correct: true)
Answer.create!(content: "Il y a un tournage de série",
               question: ex2q4,
               is_correct: false)

puts 'Done! 🍺'
