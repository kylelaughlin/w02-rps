require 'pry'
require_relative 'player.rb'

class RPSRules

  attr_reader :acceptable_choices
  attr_accessor :player_one, :player_two

  # Construct the initial state of the RPSRules class
  #
  # +player_one: a Player object
  # +player_two: a Player object
  #
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
  def determine_winner(player_one_selection, player_two_selection)
    if player_one_selection == player_two_selection
      outcome = "\nThis round was a tie. You both chose '#{player_one.move}'"
    elsif player_one_selection == "rock" && player_two_selection == "scissors" ||
      player_one_selection == "paper" && player_two_selection == "rock" ||
      player_one_selection == "scissors" && player_two_selection == "paper"
      outcome = "\n#{player_one.name} won this round!"
      @player_one.wins_round
    elsif player_two_selection == "rock" && player_one_selection == "scissors" ||
      player_two_selection == "paper" && player_one_selection == "rock" ||
      player_two_selection == "scissors" && player_one_selection == "paper"
      outcome = "\n#{player_two.name} won this round!"
      @player_two.wins_round
    else
      puts "\nSomething strange happened here"
    end
    outcome
  end

  # Runs one round of rock-paper-scissors
  #
  # Returns nil
  def run_a_round
    # Sets player one's choice
    player_one_selection = select_player_choice(@player_one)
    # Sets player two's choice
    player_two_selection = select_player_choice(@player_two)
    # Determines winner with correct output string
    puts determine_winner(player_one_selection, player_two_selection)
  end

  # Prompts player for their selection and delegates the choice to the player class
  #
  # +player: a player object for which it is their turn
  #
  # Returns a string represnting the players selected move
  def select_player_choice (player)
    puts "\n#{player.name}, it's your turn.\n\nHere are your options:\n"
    @acceptable_choices.each { |e| puts e}
    player.select_choice(self)
  end

  # Selects an element of the acceptable_choices array at random
  #
  # Returns the array element (a string) that is chosen at random
  def ai_selection
    @acceptable_choices.sample
  end

  # Checks the validity of the players choice against the acceptable_choices array
  #
  # +choice: a string representing the input provided by the player for their turn
  #
  # Returns a string representing the validated player selection
  def valid?(choice)
    @acceptable_choices.include? choice
  end

end
