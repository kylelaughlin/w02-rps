require 'pry'


# Prompt user for a selection
#
# Returns the players selection
def player_select_choice
  acceptable_choices = ['rock', 'paper', 'scissors']
  puts "Please select one of the following:"
  acceptable_choices.each { |e| puts e}
  player_choice = gets.chomp.downcase
  while !acceptable_choices.include? player_choice
    puts "\n\n'#{player_choice}' is not a valid option. Please select one of the following:"
    acceptable_choices.each { |e| puts e}
    player_choice = gets.chomp.downcase
  end
  player_choice
end

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

player_one_selection = player_select_choice

player_two_selection = player_select_choice

compare_player_selections(player_one_selection, player_two_selection)
