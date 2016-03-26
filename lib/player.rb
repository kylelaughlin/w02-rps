require 'pry'

class Player

  attr_accessor :name, :move, :wins

  # Constructs the initial state of the Player object
  #
  # +name: a string representing the name of the player
  # @move and @wins instance variables
  def initialize(name:)
    @name = name
    @move  = nil
    @wins = 0
  end

  def player_input
    gets.chomp.downcase
  end

  #acceptable_choices = ['rock', 'paper', 'scissors']

  # Prompts the user for their choice for a round
  #
  # +acceptable_choices: an array representing the allowable selections for a player to make
  #
  # Returns a string representing the choice the player has made
  def player_select_choice(acceptable_choices)
    puts "Please select one of the following:\n"
    acceptable_choices.each { |e| puts e}
    puts ""
    player_choice = player_input
    @move = input_validity(player_choice, acceptable_choices)

  end

  # Checks the validity of the players choice against the acceptable_choices array
  #
  # +player_choice: a string representing the input provided by the player for their turn
  # +acceptable_choices: an array representing the valid options for a players
  # =>  to select from
  #
  # Returns a string representing the validated player selection
  def input_validity(player_choice, acceptable_choices)
    binding.pry
    while !acceptable_choices.include? player_choice
      puts "\n\n'#{player_choice}' is not a valid option.\n"
      player_select_choice(acceptable_choices)
    end
    player_choice
  end

  # Increases @wins by one
  #
  # Returns the new value of @wins
  def wins_round
    @wins += 1
  end

end
binding.pry
