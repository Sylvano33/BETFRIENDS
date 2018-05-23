class RemoveDatetimeFromBets < ActiveRecord::Migration[5.1]
  def change
    remove_column :bets, :end_of_bet
  end
end
