require 'pry'
require_relative './lib/player.rb'
require_relative './lib/game.rb'
require_relative './lib/rps_rules.rb'
require_relative './lib/ai_player.rb'

puts "\n\nWELCOME TO ROCK PAPER SCISSORS!\n\n"

puts"------------------------------"
print "Please input a name for Player One: "
player_one_name = gets.chomp
player_one = Player.new(name: player_one_name)

print "\nPlease input a name for Player Two: "
player_two_name = gets.chomp
player_two = AIPlayer.new(name: player_two_name)
puts"------------------------------"


#Establish the rule object - - later have selection for the type of game
rule_set = RPSRules.new(player_one: player_one, player_two: player_two)
#Create a game - - for now default is rps
game = Game.new(rule_set: rule_set, player_one: player_one, player_two: player_two)
binding.pry
game.play
