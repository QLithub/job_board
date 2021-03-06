# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

500.times do
  phrases = []
  5.times do
    phrases.push(Faker::Company.catch_phrase)
  end
  Job.create!({
    title: Faker::Job.title,
    description: phrases.join(', ')
    })
end
