require 'pry'
require_relative 'rps_rules.rb'

class Game

  attr_accessor :rule_set, :player_one, :player_two

  def initialize(rule_set:, player_one:, player_two:)
    @rule_set = rule_set
    @player_one = player_one
    @player_two = player_two
  end

  #facilitate playing a game
  def play
    #Select number of players - - This may not be needed until I add in AI- assume two player for now

    #select how many rounds
      #loop the calls of the rules until a player has enough wins to break the loop
      #Report the status of wins for each players progress

    #report the winner

  end

  def select_how_many_rounds
  end

end
