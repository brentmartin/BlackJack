class Deck
  attr_accessor :cards
  def initialize
    @cards = []
    bjscoring = (1..11).to_a
    2.times do bjscoring << 11 end
    4.times do
      bjscoring.each do |n|
        @cards.push(n)
      end
    end
  end

  def cards_remaining
    @cards.length
  end

  def shuffle
    @cards = @cards.shuffle
  end

  def draw
    @cards.shift
  end
end
