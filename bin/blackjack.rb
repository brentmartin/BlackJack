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
  p_turn
  c_turn
end

  system('clear')
end


def c_thinking_UI
  print "."
  sleep 1
  print "."
  sleep 1
  print "."
  sleep 1
end


  end
end

  2.times do
  end
end

def p_turn
  p_hit = "Y"
  while p_hit.upcase == "Y"
    p_showhand_UI
    puts "Would you like another hit? (y) or (n)"
    print "> "
    p_hit = gets.chomp
    if p_hit.upcase ==  "Y"
      @p_hand.push @deck.shift
    else
    end
  end
end

def c_turn
  puts "Dealer take another hit?"
  print "> "
  c_thinking_UI
    c_turn
  end
end

end

end



intro
challenge
