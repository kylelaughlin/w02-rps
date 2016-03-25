require 'pry'
require_relative 'player.rb'

class RPSRules

  def initialize(player_one:, player_two:)
    @player_one = player_one
    @player_two = player_two
    @acceptable_choices = ['rock', 'paper', 'scissors']
  end




  # Compares player selections to deterimine a rps winner
  #
  # +player_one_selection: a string representing the players selection of rock, paper or scissors
  # +player_two_selection: a string representing the players selection of rock, paper or scissors
  #
  # Returns a string representing which player wins the round according to the rps rules
  def run_a_round(player_one_selection, player_two_selection)
    if player_one_selection == player_two_selection
      outcome = "Tie"
    elsif player_one_selection == "rock" && player_two_selection == "scissors" ||
      player_one_selection == "paper" && player_two_selection == "rock" ||
      player_one_selection == "scissors" && player_two_selection == "paper"
      outcome = "Player one wins"
      @player_one.wins_round
    elsif player_two_selection == "rock" && player_one_selection == "scissors" ||
      player_two_selection == "paper" && player_one_selection == "rock" ||
      player_two_selection == "scissors" && player_one_selection == "paper"
      outcome = "Player two wins"
      @player_two.wins_round
    else
      puts "Something strange happened here"
    end
    outcome
  end

end
