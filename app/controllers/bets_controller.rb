class BetsController < ApplicationController

  def index
    @bets = Bet.current_all.order(created_at: :desc)
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
      BetMailer.enddate(@bet).deliver_later(wait_until: 1.minute.from_now)
      redirect_to bets_path
    else
      render :new
    end

  end

  def edit
    @bet = Bet.find(params[:id])
  end

  def update
    @bet = Bet.find(params[:id])
    @bet.update(bet_params)
    redirect_to bet_path(@bet)
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
