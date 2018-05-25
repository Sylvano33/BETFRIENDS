class BetMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.bet_mailer.newbet.subject
  #

  def newbet(bet)
    @bet = bet  # Instance variable => available in view
    mail(to: @bet.receiver_email, subject: "#{@bet.user.username} veut enregister votre pari sur BETFRIENDS")
    # This will render a view in `app/views/user_mailer`!
  end

  def enddate(bet)
    @bet = bet
    mail(to: @bet.receiver_email, subject: "Alors ? Votre pari attend son gagnant sur Betfriends !")
    mail(to: @bet.user.email, subject: 'BETFRIENDS: A friend is challenging you')


  end

end

