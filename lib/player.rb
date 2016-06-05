class Player
  attr_accessor :name, :p_score, :p_hand
  def initialize(name)
    @name = name
    @p_score = p_score
    @p_hand = p_hand
  end

  def hand
    @p_hand = []
  end

  def score
    @p_score = 0
  end
end
