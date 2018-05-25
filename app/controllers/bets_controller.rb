class BetsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :update]

  def index
    @bets = current_user.bets.order(created_at: :desc) + current_user.receiver_bets.order(created_at: :desc)
    # @receiver_email = current_user.receiver_bets.order(created_at: :desc)
  end

  def show
    @bet = Bet.find(params[:id])
  end

  def new
    @bet = Bet.new
  end

  def create
    @bet = current_user.bets.new(bet_params)

    if @bet.save
      BetMailer.newbet(@bet).deliver_now
      redirect_to bets_path
    else
      render :new
    end

  end

  def edit
    @bet = Bet.find(params[:id])
  end

  def update
    bet = Bet.find(params[:id])
    receiver = User.find_by(email: bet_params[:receiver_email])
    if receiver
      bet.update(bet_params)
      UserBet.create(user: receiver, bet: bet)
      redirect_to bet_path(bet)
    else
      # l'utilisateur n'existe pas sign up + penser à creer le many to many dans UserBet
      redirect_to new_user_registration_path
    end
  end

  def destroy
    @bet = Bet.find(params[:id])
    @bet.destroy
    redirect_to bets_path
  end

  private

  def bet_params
    params.require(:bet).permit(:description, :bet_value, :receiver_email, :deadline_acceptation, :hour_countdown, :end_date_of_bet, :status)
  end
end
