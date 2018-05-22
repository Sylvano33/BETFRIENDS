class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true, uniqueness: true

  has_many :bets

  has_many :receiver_bets, through: :user_bets, source: :bet


  def launched_bets
    @bets = Bets.all
  end

  # def received_bets
  #   @
  # end

  # def launched_bets_won
  # end

  # def received_bets_won
  # end

  # def won_bets
  #   launched_bets_won + received_bets_won
  # end

  # def lost_bets
  # end

end



