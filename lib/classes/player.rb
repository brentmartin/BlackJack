class Player
  attr_accessor :name, :score, :hand, :wins
  def initialize(name)
    @name   = name
    @score  = score
    @hand   = hand
    @wins   = 0
  end

  def hand
    @hand = []
  end

  def score
    @score = 0
  end

  def wins_game
    @wins += 1
  end
end
