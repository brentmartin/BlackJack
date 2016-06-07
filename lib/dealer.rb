class Dealer
  attr_accessor :c_score, :c_hand, :c_wins
  def initialize
    @c_score = c_score
    @c_hand = c_hand
    @c_wins = -1
  end

  def hand
    @c_hand = []
  end

  def score
    @c_score = 0
  end

  def wins
    @c_wins += 1
  end
end
