class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true, uniqueness: true

  has_many :bets
  has_many :user_bets
  has_many :receiver_bets, through: :user_bets, source: :bet

  # self => User

  def launched_bets_won
    self.bets.won
  end

  def received_bets_won
    self.receiver_bets.lost
  end

  def launched_bets_lost
    self.bets.lost
  end

  def received_bets_lost
    self.receiver_bets.won
  end

  def won_bets_count
    launched_bets_won.count + received_bets_won.count
  end

  def lost_bets_count
    launched_bets_lost.count + received_bets_lost.count
  end

  def won_bets
    launched_bets_won + received_bets_won
  end

  def lost_bets
    launched_bets_lost + received_bets_lost
  end

  def bet_creator?(bet)
    bet.user == self
  end

  def won_bet?(bet)
    bet_creator?(bet) ? bet.won? : bet.lost?
  end

  def lost_bet?(bet)
    !won_bet?(bet)
  end

  def win_rate
    total_match = won_bets_count + lost_bets_count
    (won_bets_count / total_match.to_f) * 100
  end
end

