class AddReceiverFirstnameToBets < ActiveRecord::Migration[5.1]
  def change
    add_column :bets, null: false
  end
end
