class UserBet < ApplicationRecord
  belongs_to :bet, through: :user
  belongs_to :user
end
