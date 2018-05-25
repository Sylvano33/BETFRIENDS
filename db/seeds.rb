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

won = Bet.create!(description: 'Je parie avec charley que je gagne un match de fifa contre lui', bet_value: 'Je te pari une bière', receiver_email: 'name2@example2.com', deadline_acceptation: '02/10/2018', hour_countdown: '24', end_date_of_bet: '03/10/2018', status: 'won', user: bob)
lost = Bet.create!(description: 'Je parie avec selim que je suis capable de jouer de la guitare avant la date limite', bet_value: 'Je parie une painte bien fraîche', receiver_email: 'name2@example2.com', deadline_acceptation: '02/10/2018', hour_countdown: '24', end_date_of_bet: '03/10/2018', status: 'lost', user: bob)
pending = Bet.create!(description: 'Je parie que je suis awesome, je payerai le prix le cas echéant', bet_value: 'Une lapidation oklm', receiver_email: 'name2@example2.com', deadline_acceptation: '02/10/2018', hour_countdown: '24', end_date_of_bet: '03/10/2018', status: 'pending', user: bob)
accepted = Bet.create!(description: 'Je parie avec 20syl que je suis un descendant direct de zeus, si c vrai', bet_value: 'Un voyage à bamaco', receiver_email: 'name2@example2.com', deadline_acceptation: '02/10/2018', hour_countdown: '24', end_date_of_bet: '03/10/2018', status: 'accepted', user: bob)
refused = Bet.create!(description: 'Je parie avec adrien que je peux coder avec mes pieds', bet_value: 'une soirée à disneyland', receiver_email: 'name2@example2.com', deadline_acceptation: '02/10/2018', hour_countdown: '24', end_date_of_bet: '03/10/2018', status: 'refused', user: bob)


UserBet.create!(user: franck, bet: won)
UserBet.create!(user: franck, bet: lost)
UserBet.create!(user: franck, bet: pending)
UserBet.create!(user: franck, bet: accepted)
UserBet.create!(user: franck, bet: refused)

