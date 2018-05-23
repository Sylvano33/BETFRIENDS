class AddDateToBets < ActiveRecord::Migration[5.1]
  def change
    add_column :bets, :end_date_of_bet, :date
  end
end
