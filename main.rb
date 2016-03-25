require 'pry'
require_relative './lib/player.rb'

# Compares player selections to deterimine a rps winner
#
# +player_one_selection: a string representing the players selection of rock, paper or scissors
# +player_two_selection: a string representing the players selection of rock, paper or scissors
#
# Returns a string representing which player wins the round according to the rps rules
def compare_player_selections(player_one_selection, player_two_selection, player_one, player_two)
  if player_one_selection == player_two_selection
    outcome = "Tie"
  elsif player_one_selection == "rock" && player_two_selection == "scissors" ||
    player_one_selection == "paper" && player_two_selection == "rock" ||
    player_one_selection == "scissors" && player_two_selection == "paper"
    outcome = "Player one wins"
    player_one.wins_round
  elsif player_two_selection == "rock" && player_one_selection == "scissors" ||
    player_two_selection == "paper" && player_one_selection == "rock" ||
    player_two_selection == "scissors" && player_one_selection == "paper"
    outcome = "Player two wins"
    player_two.wins_round
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

print "\n\nPlay to the best of how many rounds?\n\n1. 1 round\n2. 2 out of 3\n3. 3 out of 5\n 4. 4 our of 7"
print "\nPlease select a number: "
rounds_selected = gets.chomp.to_i
while rounds_selected != 1 && rounds_selected != 2 && rounds_selected != 3
  puts "That is not a valid option please select option 1, 2, or 3."
  rounds_selected  = gets.chomp.to_i
end

num_of_rounds = nil
if rounds_selected == 1
  num _of_rounds = 1
elsif rounds_selected  == 2
  num_of_rounds = 2
elsif rounds_selected == 3
  num_of_rounds = 3
elsif rounds_selected == 4
  num_of_rounds = 4
else
  puts "Something weird happened here."
end



acceptable_choices = ['rock', 'paper', 'scissors']


while player_one.wins < num_of_rounds && player_two.wins < num_of_rounds
  player_one_selection = player_one.player_select_choice(acceptable_choices)
  player_two_selection = player_two.player_select_choice(acceptable_choices)

  outcome = compare_player_selections(player_one_selection, player_two_selection, player_one, player_two)
end

puts "\n\n#{outcome}"

binding.pry
