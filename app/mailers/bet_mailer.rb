class BetMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.bet_mailer.newbet.subject
  #


  def newbet(bet)
    @bet = bet  # Instance variable => available in view

    mail(to: @bet.receiver_email, subject: 'BET FRIENDS: A friend is challenging you')
    # This will render a view in `app/views/user_mailer`!
  end
end

