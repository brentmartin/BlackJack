require_relative '../lib/deck'
require_relative '../lib/player'
require_relative '../lib/dealer'


  end
  # puts @cards
  # puts "*" * 60
  # puts cards_remaining
  # puts "*" * 60
  # puts draw
end

def play
  p_turn
  c_turn
  p_showhand_UI
  c_showhand_UI
end

def p_showhand_UI
  system('clear')
  puts "PLAYER hand"
  print @p_hand
  puts
  puts
  puts "total is *#{p_sum}*"
  puts
  puts "-" * 60
end

def c_showhand_UI
  puts "DEALER hand"
  print @c_hand
  puts
  puts
  puts "total is *#{c_sum}*"
  puts
  puts "-" * 60
end

def c_thinking_UI
  print "."
  sleep 1
  print "."
  sleep 1
  print "."
  sleep 1
end


def p_draw
  2.times do
    @p_hand.push @deck.shift
  end
end

def c_draw
  2.times do
    @c_hand.push @deck.shift
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
  p_showhand_UI
  c_showhand_UI
  puts "Dealer take another hit?"
  print "> "
  c_thinking_UI
  if c_sum <= 16
    @c_hand.push @deck.shift
    c_turn
  end
end

def p_sum
  p_total = 0
  @p_hand.each do | card |
    p_total = card + p_total
  end
  p_total
end

def c_sum
  c_total = 0
  @c_hand.each do | card |
    c_total = card + c_total
  end
  c_total
end




play
