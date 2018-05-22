class CreateBets < ActiveRecord::Migration[5.1]
  def change
    create_table :bets do |t|
      t.text :description
      t.string :bet_value
      t.string :receiver_email
      t.integer :status
      t.integer :user_id
      t.datetime :deadline_acceptation
      t.integer :hour_countdown
      t.datetime :end_of_bet

      t.timestamps
    end
  end
end
