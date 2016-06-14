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