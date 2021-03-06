require 'active_support/core_ext/numeric/time.rb'


class BetsController < ApplicationController
  # after_action :redirect_to bets_path if: :Bet.update, only: :show
  # after_action :redirect, only: [:update]

  def redirect
    redirect_to bets_path
  end

  def index
    @bets = (current_user.bets.order(created_at: :desc) + current_user.receiver_bets.order(created_at: :desc)).sort_by { |bet| bet.created_at }.reverse
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
    receiver = User.find_by(email: bet.receiver_email)
    if receiver
      bet.update(bet_params)
      UserBet.create(user: receiver, bet: bet) if bet_params[:status] == "accepted"
      redirect_to bets_path
    else
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
    params.require(:bet).permit(:description, :bet_value, :receiver_email, :receiver_firstname, :deadline_acceptation, :hour_countdown, :end_date_of_bet, :status)
  end
end
