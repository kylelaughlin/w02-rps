require 'pry'

class Player

  attr_accessor :name, :move, :wins

  def initialize(name:)
    @name = name
    @move  = nil
    @wins = nil
  end

end
