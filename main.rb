require 'pry'
require_relative './lib/player.rb'

# Compares player selections to deterimine a rps winner
#
# +player_one_selection: a string representing the players selection of rock, paper or scissors
# +player_two_selection: a string representing the players selection of rock, paper or scissors
#
# Returns a string representing which player wins the round according to the rps rules
def compare_player_selections(player_one_selection, player_two_selection)
  if player_one_selection == player_two_selection
    outcome = "tie"
  elsif player_one_selection == "rock" && player_two_selection == "scissors" ||
    player_one_selection == "paper" && player_two_selection == "rock" ||
    player_one_selection == "scissors" && player_two_selection == "paper"
    outcome = "player one wins"
  elsif player_two_selection == "rock" && player_one_selection == "scissors" ||
    player_two_selection == "paper" && player_one_selection == "rock" ||
    player_two_selection == "scissors" && player_one_selection == "paper"
    outcome = "player two wins"
  else
    puts "Something strange happened here"
  end
  outcome
end

print "Player 1's name: "
name1 = gets.chomp
player_one = Player.new(name: name1)

print "\n\nPlayer 2's name: "
name2 = gets.chomp
player_two = Player.new(name: name2)

acceptable_choices = ['rock', 'paper', 'scissors']

player_one_selection = player_one.player_select_choice(acceptable_choices)
player_two_selection = player_two.player_select_choice(acceptable_choices)

outcome = compare_player_selections(player_one_selection, player_two_selection)
puts outcome
