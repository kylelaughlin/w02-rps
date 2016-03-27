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

  def select_choice(rule_set)
    @move = rule_set.ai_selection
  end

  

end
