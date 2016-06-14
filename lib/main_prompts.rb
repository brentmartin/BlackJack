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
    exit
  else
    system('clear')
    puts "I'm sorry, I didn't understand your answer."
    yield
    repeat_challenge
  end
end

def repeat_challenge
  system('clear')
  puts "So #{@player.name}, shall we play? (y) or (n)"
  challenge { sleep 2 }
end