# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

UserBet.destroy_all
Bet.destroy_all
User.destroy_all

bob = User.create!(username: 'blaireaudu33', email: 'name@example.com', password: 'azerty')
franck = User.create!(username: 'bgdu33', email: 'name2@example2.com', password: 'azerty')

won = Bet.create!(description: 'bet1', status: 'won', user: bob)
lost = Bet.create!(description: 'bet2', status: 'lost', user: bob)

UserBet.create!(user: franck, bet: won)
UserBet.create!(user: franck, bet: lost)

