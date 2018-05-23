# Preview all emails at http://localhost:3000/rails/mailers/bet_mailer
class BetMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/bet_mailer/newbet
  def newbet
    bet = Bet.first
    BetMailer.newbet(Bet.first).deliver_now
  end

end
