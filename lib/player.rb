class Player
  attr_accessor :name, :p_score, :p_hand, :p_wins
  def initialize(name)
    @name = name
    @p_score = p_score
    @p_hand = p_hand
    @p_wins = p_wins
  end

  def hand
    @p_hand = []
  end

  def score
    @p_score = 0
  end

  def wins
    @p_wins =+ 1
  end
end
