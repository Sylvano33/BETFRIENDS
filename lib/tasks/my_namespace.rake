namespace :bet do
  desc "Détruis chaque pari dont la deadline_acceptation est dépassée, la rake task doit passer toutes les heures"
  task destroy_if_unaccepted: :environment do
    bets_to_destroy = Bet.unaccepted
    bets_to_destroy.destroy_all
  end
end
