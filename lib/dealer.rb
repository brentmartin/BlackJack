class Dealer
  attr_accessor :c_score, :c_hand
  def initialize
    @c_score = c_score
    @c_hand = c_hand
  end

  def hand
    @c_hand = []
  end

  def score
    @c_score = 0
  end
end
