class AddReceiverFirstnameToBets < ActiveRecord::Migration[5.1]
  def change
    add_column :bets, :receiver_firstname, :string, null: false
  end
end
