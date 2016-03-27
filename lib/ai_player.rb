require 'pry'

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

end
