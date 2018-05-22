class CreateUserBets < ActiveRecord::Migration[5.1]
  def change
    create_table :user_bets do |t|
      t.references :bet, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
