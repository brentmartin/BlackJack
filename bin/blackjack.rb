require_relative '../lib/deck'
require_relative '../lib/player'
require_relative '../lib/dealer'

def intro
  system('clear')
  puts "Welcome to Blackjack, what is your name?"
  print "> "
  name = gets.chomp
  sleep 1
  system('clear')
  print "Howdy #{name}, "
end

def challenge
  puts "shall we play? (y) or (n)"
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
    system('clear')
    print "So "
    challenge
  end
end

def play
  @deck.shuffle
  @c_score = @computer.score
  @p_score = @player.score
  @c_hand = @computer.hand
  @p_hand = @player.hand
  p_deal
  c_deal
  p_turn
  c_turn
  sleep 2
  system('clear')
  p_showhand
  c_showhand
  determine_winner
end

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
  print ":player => "
  print @p_hand
  puts
  puts
  puts "player total is *#{@p_score}*"
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


intro
@player = Player.new("PLAYER")
@computer = Dealer.new
@deck = Deck.new
challenge
