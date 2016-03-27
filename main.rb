require 'pry'
require_relative './lib/player.rb'
require_relative './lib/game.rb'
require_relative './lib/rps_rules.rb'
require_relative './lib/ai_player.rb'
require_relative './lib/ttt_rules.rb'

# Creates a user player object
#
# returns the new player object
def create_player
  name = gets.chomp
  player = Player.new(name: name)
end

# Creates a player one, player two or both ai player objects
#
# +player_position: an integer representing if an ai player is player one or two
#
# Returns nil
def create_ai_player(player_position)
  if player_position == 1
    player = AIPlayer.new(name: "Jack the Computer")
  elsif player_position == 2
    player = AIPlayer.new(name: "Jill the Computer")
  else
    puts "Something happened here - Create AI Players"
  end
end

puts "######   WELCOME!!!   ######"

continue = "y"
while ["y","yes"].include? continue

  #Selection of game type
  print "\n\nPlease select a game to play:\n\n1. Rock-Paper_Scissors\n2. Tic-Tac_Toe\n\n>"
  game_choice = gets.chomp.to_i

  #Checking for validity of users selection
  while game_choice != 1 && game_choice != 2
    puts "That is not a valid input. Select option 1 or 2."
    game_choice = gets.chomp.to_i
  end

  # Acknowledging the users game type decision
  if game_choice == 1
    puts "\n\nROCK-PAPER-Scissors"
  elsif game_choice == 2
    puts "\n\nTIC-TAC-TOE"
  else
    puts "Something weird happened in the game type selection"
  end


  # Selecting a game mode for how many user players or ai players
  print "Please select the game mode:\n1. Two Player Mode\n2. One Player vs. Computer\n3. Computer vs Computer\n>"
  mode_selection = gets.chomp.to_i

  #Checking the validity of the users game mode decision
  while mode_selection != 1 && mode_selection !=2 && mode_selection != 3
    puts "That is not a valid input. Select option 1, 2, or 3."
    mode_selection = gets.chomp.to_i
  end

  # Depending on the game mode selection prompts user for names and creates players
  puts "------------------------------\n"
  if mode_selection == 1
    print "Please input a name for Player One\n>"
    player_one = create_player
    print "Please input a name for Player Two\n>"
    player_two = create_player
  elsif mode_selection == 2
    print "Please input a name for Player One\n>"
    player_one = create_player
    player_two = create_ai_player(2)
    print "\nYour opponent is #{player_two.name}."
  elsif mode_selection == 3
    player_one = create_ai_player(1)
    player_two = create_ai_player(2)
    print "\n#{player_one.name} vs. #{player_two.name}"
  else
    puts "Something very strange happened here - mode selection"
  end
  puts "\n------------------------------"

  # Establish the rule object
  if game_choice == 1
    rule_set = RPSRules.new(player_one: player_one, player_two: player_two)
  elsif game_choice == 2
    rule_set = TTTRules.new(player_one: player_one, player_two: player_two)
  else
    puts "Something weird happened when initiating rule_set"
  end

  # Create a game
  game = Game.new(rule_set: rule_set, player_one: player_one, player_two: player_two)

  # Start the game
  game.play

  print "\n\nWould you like to play another game? (Y/N)\n>"
  continue = gets.chomp.downcase
  while !["n","no","y","yes"].include? continue
    print "That is not a valid response. Would you like to play another game? (Y/N)\n>"
    continue = gets.chomp.downcase
  end
end
