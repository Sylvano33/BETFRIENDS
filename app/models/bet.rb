class Bet < ApplicationRecord
  belongs_to :user
  has_many :user_bets
  enum status: [ :pending, :accepted, :refused, :won, :lost ]
  # scope :won, ->{ where status: :won }

  validates :description, presence: true
  validates :bet_value, presence: true
  validates :receiver_email, presence: true
  validates :receiver_firstname, presence: true
  validates_inclusion_of :hour_countdown, :in => 1..24
  validates_format_of :receiver_email, with:  /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create
  validates :end_date_of_bet, presence: true

  after_create :send_bet_email
  after_create :set_deadline_acceptation

  def deadline_hour
    deadline = self.deadline_acceptation.to_s.to_datetime
    deadline.strftime("%v %r")
  end

  def self.unaccepted
    where('deadline_acceptation < ?', Time.zone.now ).where(status: "pending")
  end


  private

  def send_bet_email
    BetMailer.newbet(self).deliver_now
    BetMailer.enddate(@bet).deliver_later(wait_until: 1.minute.from_now)
  end

  def set_deadline_acceptation
    self.deadline_acceptation = self.created_at.to_datetime + (self.hour_countdown).hours
    self.save
  end

end

