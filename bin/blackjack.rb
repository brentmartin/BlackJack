require_relative '../lib/deck'
require_relative '../lib/player'
require_relative '../lib/dealer'

def boot_up
  intro_name
  name = gets.chomp
  @player = Player.new(name)
  @name = @player.name
  @p_wins = @player.wins
  @computer = Dealer.new
  @c_wins = @computer.wins
  intro_challenge
end

def play
  setup
  p_deal
  c_deal
  p_turn
  c_turn
  p_showhand
  c_showhand
  determine_winner
  summary
end

def intro_name
  system('clear')
  puts "Welcome to Blackjack, what is your name?"
  print "> "
end

def intro_challenge
  sleep 1
  system('clear')
  puts "Howdy #{@name}, shall we play? (y) or (n)"
  challenge
end

def challenge
  print "> "
  question_playgame = gets.chomp
  if question_playgame == "y"
    system('clear')
    puts "Alright! Lets get started."
    sleep 2
    play
  elsif question_playgame == "n"
    system('clear')
    puts "Have a wonderful evening!"
    sleep 2
  else
    system('clear')
    puts "I'm sorry, I didn't understand your answer."
    sleep 2
    repeat_challenge
  end
end

def repeat_challenge
  system('clear')
  puts "So #{@name}, shall we play? (y) or (n)"
  challenge
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
  puts "So #{@name}, shall we play again? (y) or (n)"
  challenge
end

def setup
  @deck = Deck.new
  @deck.shuffle
  @c_score = @computer.score
  @p_score = @player.score
  @c_hand = @computer.hand
  @p_hand = @player.hand
end

# PLAYER actions
def p_count
  total = 0
  @p_hand.each do | card |
    total = card + total
  end
  @p_score = total
end

def p_deal
  2.times do
    @p_hand.push @deck.draw
  end
end

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
  print "#{@name} => "
  print @p_hand
  puts
  puts
  puts "player total is *#{@p_score}*"
  puts
  puts "━" * 60
end

# DEALER actions
def c_count
  total = 0
  @c_hand.each do | card |
    total = card + total
  end
  @c_score = total
end

def c_deal
  2.times do
    @c_hand.push @deck.draw
  end
end

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

def c_showhand
  print "[DEALER] > "
  print @c_hand
  puts
  puts
  puts "dealer total is *#{@c_score}*"
  puts
  puts "━" * 60
end

def c_thinking_UI
  print "."
  sleep 1
  print "."
  sleep 1
  print "."
  sleep 1
end

# board logic
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
    @c_wins = @computer.wins
  elsif @p_score > @c_score
    @outcome = "#{@name} WINS!"
    @p_wins = @player.wins
  elsif @p_score == @c_score
    @outcome = "IT'S A TIE!"
  else
    puts "ERROR... something doesn't add up"
  end
  puts @outcome
end

def score_board
  if @p_wins == 0 then @p_board = "00" end
  if @p_wins <= 9 then @p_board = "0#{@p_wins}" end
  if @p_wins >= 10 then @p_board = "#{@p_wins}" end
  if @c_wins == 0 then @c_board = "00" end
  if @c_wins <= 9 then @c_board = "0#{@c_wins}" end
  if @c_wins >= 10 then @c_board = "#{@c_wins}" end
end

boot_up
