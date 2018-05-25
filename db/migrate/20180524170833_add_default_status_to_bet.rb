class AddDefaultStatusToBet < ActiveRecord::Migration[5.1]
  def change
    change_column :bets, :status, :integer, default: 0
  end
end
