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