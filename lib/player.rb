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

  def input(acceptable_choices)
    print "\nPlease make a selection\n>"
    gets.chomp.downcase
  end

  #acceptable_choices = ['rock', 'paper', 'scissors']

  # Prompts the user for their choice for a round
  #
  # +acceptable_choices: an array representing the allowable selections for a player to make
  #
  # Returns a string representing the choice the player has made
  def select_choice(rule_set)
    acceptable_choices = rule_set.acceptable_choices
    choice = input(acceptable_choices)
    validity = rule_set.valid?(choice)
    while !validity do
      puts "\n'#{choice}' is an invalid selection."
      choice = input(acceptable_choices)
      validity = rule_set.valid?(choice)
    end
    @move = choice
  end

  # Increases @wins by one
  #
  # Returns the new value of @wins
  def wins_round
    @wins += 1
  end

end
