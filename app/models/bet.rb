class Bet < ApplicationRecord
  belongs_to :user
  has_many :user_bets
  enum status: [ :pending, :accepted, :refused, :won, :lost ]
  validates :description, presence: true
  # validates :bet_value, presence: true
  # validates :receiver_email, presence: true
  # validates :end_of_bet, presence: true
end
