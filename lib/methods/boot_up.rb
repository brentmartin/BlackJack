def boot_up
  intro_name
  name      = gets.chomp
  @player   = Player.new(name)
  @computer = Player.new(nil)
  intro_challenge
end