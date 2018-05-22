class BetsController < ApplicationController
  def index
    @bets = Bet.all
  end

  def show
    @bet = Bet.find(params[:id])
  end

  def new
    @bet = Bet.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def bet_params
    params.require(:bet).permit()
  end
end
