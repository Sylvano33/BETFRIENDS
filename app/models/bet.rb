class Bet < ApplicationRecord
  belongs_to :user
  has_many :user_bets
  enum status: [ :pending, :accepted, :refused, :won, :lost ]
  # scope :won, ->{ where status: :won }



  validates :description, presence: true
  validates :bet_value, presence: true
  validates :receiver_email, presence: true
  validates_inclusion_of :hour_countdown, :in => 1..48
  validates_format_of :receiver_email, with:  /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create
  validates :end_date_of_bet, presence: true

  after_create :send_bet_email

  private

  def send_bet_email
    BetMailer.newbet(self).deliver_now
  end
end

