require 'pry'
require_relative './lib/player.rb'
require_relative './lib/game.rb'
require_relative './lib/rps_rules.rb'
require_relative './lib/ai_player.rb'

def create_player
  name = gets.chomp
  player = Player.new(name: name)
end

def create_ai_player(player_position)
  if player_position == 1
    player = AIPlayer.new(name: "Jack the Computer")
  elsif player_position == 2
    player = AIPlayer.new(name: "Jill the Computer")
  else
    puts "Something happened here - Create AI Players"
  end
end

puts "\n\nWELCOME TO ROCK PAPER SCISSORS!\n\n"

print "Please select the game mode:\n1. Two Player Mode\n2. One Player vs. Computer\n3. Computer vs Computer\n>"
mode_selection = gets.chomp.to_i
while mode_selection != 1 && mode_selection !=2 && mode_selection != 3
  puts "That is not a valid input. Select option 1, 2, or 3."
  mode_selection = gets.chomp.to_i
end
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

=begin
puts"------------------------------"
print "Please input a name for Player One: "
player_one_name = gets.chomp
player_one = Player.new(name: player_one_name)

print "\nPlease input a name for Player Two: "
player_two_name = gets.chomp
player_two = Player.new(name: player_two_name)
puts"------------------------------"
=end

#Establish the rule object - - later have selection for the type of game
rule_set = RPSRules.new(player_one: player_one, player_two: player_two)
#Create a game - - for now default is rps
game = Game.new(rule_set: rule_set, player_one: player_one, player_two: player_two)
binding.pry
game.play
