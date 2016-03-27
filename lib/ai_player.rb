require 'pry'
require_relative 'rps_rules.rb'

class AIPlayer

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

  # Set @move to a valid choice
  #
  # +rule_set: the rules object controling the rules of the game
  #
  # Returns the ai_player's valid move as a string
  def select_choice(rule_set)
    @move = rule_set.ai_selection
    puts ">#{@move}"
    @move
  end

  # Increases @wins by one
  #
  # Returns the new value of @wins
  def wins_round
    @wins += 1
  end

end
