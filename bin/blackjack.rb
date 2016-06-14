# Retrieve absolute directory as current_folder
current_folder = File.expand_path('../../', __FILE__)
Dir["#{current_folder}/**/*.rb"].each { |f| require f }

def boot_up
  intro_name
  name      = gets.chomp
  @player   = Player.new(name)
  @computer = Player.new(nil)
  intro_challenge
end

boot_up
