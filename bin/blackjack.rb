require_relative '../lib/deck'
require_relative '../lib/player'

def boot_up
  intro_name
  name      = gets.chomp
  @player   = Player.new(name)
  @computer = Player.new(nil)
  intro_challenge
end

def intro_name
  system('clear')
  puts "Welcome to BlackJack, what is your name?"
  print "> "
end

def intro_challenge
  sleep 1
  system('clear')
  puts "Howdy #{@player.name}, shall we play? (y) or (n)"
  challenge { sleep 3 }
end

def challenge
  print "> "
  question_playgame = gets.chomp
  if question_playgame.downcase == "y"
    system('clear')
    puts "Alright! Let's get started."
    yield
    play
  elsif question_playgame.downcase == "n"
    system('clear')
    puts "Have a wonderful evening!"
    yield
  else
    system('clear')
    puts "I'm sorry, I didn't understand your answer."
    yield
    repeat_challenge
  end
end

def play
  setup
  deal(@p_hand)
  deal(@c_hand)
  p_turn
  c_turn
  p_showhand
  c_showhand
  determine_winner
  summary
end

def repeat_challenge
  system('clear')
  puts "So #{@player.name}, shall we play? (y) or (n)"
  challenge { sleep 2 }
end

def setup
  @deck = Deck.new
  @deck.shuffle
  @c_score = @computer.score
  @p_score = @player.score
  @c_hand  = @computer.hand
  @p_hand  = @player.hand
end

def deal(hand)
  2.times do
    hand.push @deck.draw
  end
end

# User actions
def p_turn
  hit = "Y"
  while hit.upcase == "Y"
    system('clear')
    p_count
    p_showhand
    puts "Would you like another hit? (y) or (n)"
    print "> "
    hit = gets.chomp
    if hit.upcase ==  "Y"
      @p_hand.push @deck.draw
    else
    end
  end
end

def p_showhand
  print "#{@player.name} => "
  print @p_hand
  puts
  puts
  puts "player total is *#{@p_score}*"
  puts
  puts "━" * 60
end

def p_count
  total = 0
  @p_hand.each do | card |
    total = card + total
  end
  @p_score = total
end

# Computer actions
def c_turn
  system('clear')
  c_count
  p_showhand
  c_hidehand
  puts "Dealer take another hit?"
  print "> "
  c_thinking_UI
  if @c_score <= 16
    @c_hand.push @deck.draw
    c_turn
  end
  system('clear')
end

def c_showhand
  print "[DEALER] > "
  print @c_hand
  puts
  puts
  puts "dealer total is *#{@c_score}*"
  puts
  puts "━" * 60
end

def c_count
  total = 0
  @c_hand.each do | card |
    total = card + total
  end
  @c_score = total
end

def c_hidehand
  print ":dealer > "
  print "[X"
  print ", X" * (@c_hand.count - 1)
  puts "]"
  puts
  puts "dealer total is *X*"
  puts
  puts "━" * 60
end

def c_thinking_UI
  3.times do
    print "."
    sleep 1
  end
end

# Score keeping
def determine_winner
  puts
  print "Player = #{@p_score}"
  print "  |  "
  print "Dealer = #{@c_score}"
  puts
  if @p_score >= 22
    @p_score = 0
  end
  if @c_score >= 22
    @c_score = 0
  end
  if @p_score < @c_score
    @outcome = "DEALER WINS!"
    @computer.wins_game
  elsif @p_score > @c_score
    @outcome = "#{@player.name} WINS!"
    @player.wins_game
  elsif @p_score == @c_score
    @outcome = "IT'S A TIE!"
  else
    puts "ERROR... something doesn't add up"
  end
  puts @outcome
end

def summary
  sleep 3
  system('clear')
  score_board
  puts @outcome
  puts
  puts "━" * 60
  puts
  puts "And our total win (and we don't count ties, so don't ask) count is:"
  puts "                                                              "
  puts "                    |  Player  |  Dealer  |                     "
  puts "                    |          |          |                     "
  puts "                    |    #{@p_board}    |    #{@c_board}    |                     "
  puts "                    |          |          |                     "
  puts "                    |          |          |                     "
  puts
  puts "━" * 60
  puts "So #{@player.name}, shall we play again? (y) or (n)"
  challenge { sleep 2 }
end

def board_val(wins)
  "%02d" % wins
end

def score_board
  @p_board = board_val(@player.wins)
  @c_board = board_val(@computer.wins)
end

boot_up
