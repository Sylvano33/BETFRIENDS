class Bet < ApplicationRecord
  belongs_to :user
  has_many :user_bets
  enum status: [ :pending, :accepted, :refused, :won, :lost ]
  # scope :won, ->{ where status: :won }
  validates :description, presence: true
  validates :bet_value, presence: true
  validates :receiver_email, presence: true
  validates :end_date_of_bet, presence: true

end
